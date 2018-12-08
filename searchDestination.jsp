<%@ page contentType="text/html;charset=gb2312"%>
<HTML><HEAD><style type="text/css">
@import url("css/common.css");
</style>
</HEAD>
<div class="footer"><Font size=2>
<div align=center>
<br>查询时可以输入终点.<br>

<br>输入时间请输入具体时间用数字表示&nbsp;&nbsp;例如13:10<br>

<FORM action="searchByConditionServlet" Method="post">
    <br>输入查询信息:<Input type=text name="searchMess"><br>
    <input type=radio name="radio" value="cosmetic_number">终点
    <Input type=radio name="radio" value="cosmetic_name" checked="ok">列车号
    <Input type=radio name="radio" value="cosmetic_price">时间
    <br><Input type=submit name="g" value="查询">
</Form>
 <br />
 </div>
  <div class="footer">
    <p align="center"><a href="index.jsp">首页</a> | 
<a href="lookTicket.jsp#content">查询车票</a>|
<a href="searchDestination.jsp#content">查询终点</a> |
<a href="Order.jsp#content">查看订单</a> |
<a href="ShoppingCar.jsp#content">我的车票</a>
     <br />
</div>
</Font></BODY></HTML>
