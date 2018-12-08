<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="mybean.data.Login" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>

<HTML>

<head><%@ include file="head.txt" %>
<style type="text/css">
@import url("css/common.css");
</style></head>
<Body>
<div class="content align="center">
  <input type="button" name="Submit" onClick="javascript:history.back(-1);" value="返回" class="btn">

<center>
<%
  if(loginBean==null){
    response.sendRedirect("login.jsp#content");
  }
  else{
    boolean b= loginBean.getLogname()==null||loginBean.getLogname().length()==0;
    if(b)
      response.sendRedirect("login.jsp#content");
  }
  String numberID=request.getParameter("xijie");
  out.print("<th>列车号"+numberID);
  if(numberID==null){
    out.print("没有列车号,无法查看细节");
    return;
  }
  Connection con;
  Statement sql;
  ResultSet rs;
  try{Class.forName("com.mysql.jdbc.Driver");}
  catch(Exception e){}
  String uri="jdbc:mysql://127.0.0.1/trainticket?"+"user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";
  try{
    con=DriverManager.getConnection(uri);
    sql=con.createStatement();
    String cdn="SELECT * FROM cosmeticForm where cosmetic_number='"+numberID+"'";
    rs=sql.executeQuery(cdn);
    out.print("<table border=2>");
    out.print("<tr>");
    out.print("<th>列车号");
    out.print("<th>起点");
    out.print("<th>终点");
    out.print("<th>时间");
    out.print("<th>票价");
    out.print("<th><font color=yellow>放入购物车</font>");
    out.print("</tr>");
    String detailMess="";
    while(rs.next()){
    String number=rs.getString(1);
    String start=rs.getString(2);
    String destination=rs.getString(3);
    String price=rs.getString(4);
    detailMess=rs.getString(5);
    picture=rs.getString(6);    //便于购物车计算价格，尾缀上“#”价格值
    String goods="("+number+","+start+","+destination+","+price+")#"+price;
    goods=goods.replaceAll("\\p{Blank}","");
    String button="<form action='putGoodsServlet' method='post'>"
      +"<input type='hidden' name='java' value="+goods+">"
      +"<input type='submit' value='放入购物车' class='putincar'></form>";
    out.print("<br/>");
    out.print("<tr>");
    out.print("<td>"+number+"</td>");
    out.print("<td>"+start+"</td>");
    out.print("<td>"+destination+"</td>");
	out.print("<td>"+time+"</td>");
    out.print("<td>"+price+"</td>");
    out.print("<td>"+button+"</td>");
    out.print("</tr>");
    }
    out.print("</table>");
    out.print("终点详情:<br>");
    out.println("<div align=center>"+detailMess+"<div>");
    String pic="<img src='image/"+picture+"'width=300 height=200></img>";
    out.print(pic);
    con.close();
  }
  catch(SQLException exp){}
%>
</Center>
</div>
<div class="footer">
  <br />
    <p align="center"><a href="index.jsp">首页</a> | 
<a href="lookTicket.jsp#content">查询车票</a>|
<a href="searchDestination.jsp#content">查询终点</a> |
<a href="Order.jsp#content">查看订单</a> |
<a href="ShoppingCar.jsp#content">我的车票</a>
     <br />
     <br />
      Copyright &copy; &nbsp;<a href="yuanshishuzhai.html">南山车站</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;热线：888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;地址：深圳市南山区华侨城暨南大学深圳旅游学院</p> 
  </div>
</BODY></HTML>
