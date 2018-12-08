<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="mybean.data.Login" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<HTML>
<head><%@ include file="head.txt" %>
</style></head>
<Body>
<div>
<center>
<%
  if(loginBean==null){
    response.sendRedirect("login.jsp");
  }
  else{
    boolean b= loginBean.getLogname()==null||loginBean.getLogname().length()==0;
    if(b)
      response.sendRedirect("login.jsp");
  }
  String numberID=request.getParameter("xijie");
  out.print("<th>票号"+numberID);
  if(numberID==null){
    out.print("什么都查不到啊，晚点再来吧");
    return;
  }
  Connection con;
  Statement sql;
  ResultSet rs;
  try{Class.forName("com.mysql.jdbc.Driver");}
  catch(Exception e){}
  String uri="jdbc:mysql://127.0.0.1/cinema?"+"user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";
  try{
    con=DriverManager.getConnection(uri);
    sql=con.createStatement();
    String cdn="SELECT * FROM ticket where number='"+numberID+"'";
    rs=sql.executeQuery(cdn);
    out.print("<table border=2>");
    out.print("<tr>");
    out.print("<th>票号");
    out.print("<th>电影名");
    out.print("<th>导演");
    out.print("<th>日期");
    out.print("<th>票价");
    out.print("<th><font color=yellow>放入购物车</font>");
    out.print("</tr>");
    String detailMess="";
    while(rs.next()){
        String number=rs.getString(1);
        String name=rs.getString(2);
        String director=rs.getString(3);
        String date=rs.getString(4);
        String price=rs.getString(5);
        String picture=rs.getString(6);
        detailMess=rs.getString(7);
        String goods="("+number+","+name+","+director+","+date+","+price+")#"+price;   //便于购物车计算价格，尾缀上“#”价格值
        goods= goods.replaceAll("\\p{Blank}","");
        String button="<form action='putGoodsServlet' method='post'>"
          +"<input type='hidden' name='java' value="+goods+">"
          +"<input type='submit' value='放入购物车></form>";
        out.print("<br/>");
        out.print("<tr>");
        out.print("<td>"+number+"</td>");
        out.print("<td>"+name+"</td>");
        out.print("<td>"+director+"</td>");
        out.print("<td>"+date+"</td>");
        out.print("<td>"+price+"</td>");
        out.print("<td>"+button+"</td>");
        out.print("</tr>");
    }
    out.print("</table>");
    out.print("电影详情:<br>");
    out.println("<div align=center>"+detailMess+"<div>");
    String pic="<img src='image/"+picture+"' width=300 height=200></img>";
    out.print(pic);
    con.close();
  }
  catch(SQLException exp){}
%>
</Center>
</div>
</BODY></HTML>
