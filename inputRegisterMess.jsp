<%@ page contentType="text/html;charset=gb2312" %><HEAD>
<%@ include file="head.txt" %>
<style type="text/css">
@import url("css/common.css");

</style>
</HEAD>

<jsp:useBean id="userBean" class="mybean.data.Register" scope="request" />

<title>注册页面</title>
<HTML><BODY><Font size=2>

<div id="content"> 
    <div align="center">
    <FORM action="registerServlet" method="post" name=form>
    <table>
    用户名由字母、数字、下划线构成，*注释的项必须填写
    <h1 align="center">注册</h1>
    <tr><td>*用户名称：</td>
        <td><input type=text name="logname" ></td>
        <td>*用户密码：</td>
        <td><input type=password name="password"></td>
    </tr>
    <tr><td>*重复密码：</td>
        <td><input type=password name="again_password"></td>
        <td>&nbsp;&nbsp;联系电话：</td>
        <td><input type=text name="phone"></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;家庭地址：</td><td><input type=text name="recongition"></td>
        <td>&nbsp;&nbsp;真实姓名：</td><td><input type=text name="realname"></td>
        
        <td><input type=submit name="g" value="提交" class="submit"></td>
    </tr></table></Form></div>
    <br/><br/>
    <div align="center">
    <p><h1>注册反馈</h1>
    <jsp:getProperty name="userBean" property="backNews"/>
    <table>
    <tr><td>会员名称：</td>
    <td><jsp:getProperty name="userBean" property="logname" /></td>
    <tr><td>姓名：</td>
    <td><jsp:getProperty name="userBean" property="realname" /></td>
    <tr><td>地址：</td>
    <td><jsp:getProperty name="userBean" property="address" /></td>
    <tr><td>电话：</td>
    <td><jsp:getProperty name="userBean" property="phone" /></td>
    </table></div>
</div>
<hr color="#FFFF00">
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
</div>


</Body></HTML>
