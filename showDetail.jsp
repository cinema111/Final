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
  out.print("<th>Ʊ��"+numberID);
  if(numberID==null){
    out.print("ʲô���鲻���������������");
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
    out.print("<th>Ʊ��");
    out.print("<th>��Ӱ��");
    out.print("<th>����");
    out.print("<th>����");
    out.print("<th>Ʊ��");
    out.print("<th><font color=yellow>���빺�ﳵ</font>");
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
        String goods="("+number+","+name+","+director+","+date+","+price+")#"+price;   //���ڹ��ﳵ����۸�β׺�ϡ�#���۸�ֵ
        goods= goods.replaceAll("\\p{Blank}","");
        String button="<form action='putGoodsServlet' method='post'>"
          +"<input type='hidden' name='java' value="+goods+">"
          +"<input type='submit' value='���빺�ﳵ></form>";
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
    out.print("��Ӱ����:<br>");
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
