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
  <input type="button" name="Submit" onClick="javascript:history.back(-1);" value="����" class="btn">

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
  out.print("<th>�г���"+numberID);
  if(numberID==null){
    out.print("û���г���,�޷��鿴ϸ��");
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
    out.print("<th>�г���");
    out.print("<th>���");
    out.print("<th>�յ�");
    out.print("<th>ʱ��");
    out.print("<th>Ʊ��");
    out.print("<th><font color=yellow>���빺�ﳵ</font>");
    out.print("</tr>");
    String detailMess="";
    while(rs.next()){
    String number=rs.getString(1);
    String start=rs.getString(2);
    String destination=rs.getString(3);
    String price=rs.getString(4);
    detailMess=rs.getString(5);
    picture=rs.getString(6);    //���ڹ��ﳵ����۸�β׺�ϡ�#���۸�ֵ
    String goods="("+number+","+start+","+destination+","+price+")#"+price;
    goods=goods.replaceAll("\\p{Blank}","");
    String button="<form action='putGoodsServlet' method='post'>"
      +"<input type='hidden' name='java' value="+goods+">"
      +"<input type='submit' value='���빺�ﳵ' class='putincar'></form>";
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
    out.print("�յ�����:<br>");
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
    <p align="center"><a href="index.jsp">��ҳ</a> | 
<a href="lookTicket.jsp#content">��ѯ��Ʊ</a>|
<a href="searchDestination.jsp#content">��ѯ�յ�</a> |
<a href="Order.jsp#content">�鿴����</a> |
<a href="ShoppingCar.jsp#content">�ҵĳ�Ʊ</a>
     <br />
     <br />
      Copyright &copy; &nbsp;<a href="yuanshishuzhai.html">��ɽ��վ</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;���ߣ�888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;��ַ����������ɽ�����ȳ����ϴ�ѧ��������ѧԺ</p> 
  </div>
</BODY></HTML>
