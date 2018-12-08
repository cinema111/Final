<%@page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*" %>
<HTML>

<head><%@ include file="head.txt" %>
<style type="text/css">
@import url("css/common.css");
</style></head>

<BODY>
<div class="content" align="center">
<font size=2>
<h1>查询票类</h1>
<%  try{ Class.forName("com.mysql.jdbc.Driver");
        }
    catch(Exception e){}
    String uri="jdbc:mysql://127.0.0.1/trainticket?"+"user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";

    Connection con;
    Statement sql;
    ResultSet rs;
    try{
      con=DriverManager.getConnection(uri);
      sql=con.createStatement();
      //读取classify表，获得分类;
      rs=sql.executeQuery("SELECT * FROM classify ");
      out.print("<form action='queryServlet' method='post'>");
      out.print("<select name='fenleiNumber'>");
      while(rs.next()){
        int id=rs.getInt(1);
        String name=rs.getString(2);
        out.print("<option value="+ id +">"+name+"</option>");
      }
      out.print("</select>");
      out.print("<br/>");
      out.print("<br/>");
      out.print("<input type='submit' value='提交' class='submit'>");
      out.print("</form>");
      out.print("</div>");
      con.close();
    }
    catch(SQLException e){
      out.print(e);
    }
%>
</font></div>


<div class="footer">
    <p align="center"><a href="index.jsp">首页</a> |
<a href="lookTicket.jsp#content">查询车票</a>|
<a href="searchDestination.jsp#content">查询终点</a> |
<a href="lookOrderForm.jsp#content">查看订单</a> |
<a href="lookShoppingCar.jsp#content">我的车票</a>
     <br />
     <br />
      Copyright &copy; &nbsp;<a href="index.jsp">南山车站</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;热线：808-100-2010&nbsp;&nbsp;| &nbsp;&nbsp;地址：深圳市南山区华侨城暨南大学深圳旅游学院</p>
</div>



</BODY></HTML>
