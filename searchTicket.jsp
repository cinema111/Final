
<%@ page contentType="text/html;charset=gb2312"%>
<HTML><HEAD><%@ include file="head.txt"%></HEAD>
<BODY background=image/happy.jpg><Font size=2>
<div align=center>
<br>查询时可以输入电影名，导演名或观影日期.<br>
电影名和导演名搜索支持模糊查询
<br>观影日期请按2000-12-24的格式输入<br>
<FORM action="searchByConditionServlet" Method="post">
<br>输入查询信息:<Input type=text name="searchMess"><br>
<input type=radio name="radio" value="film_name" checked="ok">电影名
<Input type=radio name="radio" value="director">导演名字
<Input type=radio name="radio" value="date">观影日期
<br><Input type=submit name="g" value="查询">
</Form>
</div>
</Font></BODY></HTML>
