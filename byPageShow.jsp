<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="mybean.data.DataByPage" %>
<%@ page import="com.sun.rowset.*" %>
<jsp:useBean id="dataBean" class="mybean.data.DataByPage" scope="session"/>

<HTML>
<head><%@ include file="head.txt" %>
<style type="text/css">
@import url("css/common.css");
</style></head>
<Body>
<div class="content" align="center">
<input type="button" name="Submit" onClick="javascript:history.back(-1);" value="返回" class="btn">
<center>
<BR><h3>当前显示的内容是：</h3>
<table border=2>
<tr>
    <th>列车号</th>
    <th>起点</th>
    <th>终点</th>
    <th>时间</th>
    <th>票价</th>
    <th>查看详情</th>
    <th>添加到购物车</th>
</tr>
<jsp:setProperty name="dataBean" property="pageSize" param="pageSize"/>
<jsp:setProperty name="dataBean" property="currentPage" param="currentPage"/>
<%
  CachedRowSetImpl rowSet=dataBean.getRowSet();
  if(rowSet==null){
    out.print("抱歉，没有相关车票信息"+"<br/>");
    return;
  }
  rowSet.last();
  int totalRecord=rowSet.getRow();
  out.println("全部记录数"+totalRecord);   
  int pageSize=dataBean.getPageSize();    
  int totalPages=dataBean.getTotalPages();    
  if(totalRecord%pageSize==0)
      totalPages=totalRecord/pageSize;
  else
     totalPages=totalRecord/pageSize+1;
  dataBean.setPageSize(pageSize);
  dataBean.setTotalPages(totalPages);
  if(totalPages>=1){
    if(dataBean.getCurrentPage()<1)
      dataBean.setCurrentPage(dataBean.getTotalPages());
    if(dataBean.getCurrentPage()>dataBean.getTotalPages())
      dataBean.setCurrentPage(1);
    int index=(dataBean.getCurrentPage()-1)*pageSize+1;
    rowSet.absolute(index);
    boolean boo=true;
    for(int i=1;i<=pageSize&&boo;i++){
      String number=rowSet.getString(1);
      String name=rowSet.getString(2);
      String maker=rowSet.getString(3);
      String price=rowSet.getString(4);
      String goods="("+number+","+name+","+maker+","+price+")#"+price;
      goods=goods.replaceAll("\\p{Blank}","");
      String button="<form action='putGoodsServlet' method='post'>"+
        "<input type='hidden' name='java' value="+goods+">"+
        "<input type='submit' value='放入购物车' class='putincar'></form>";
      String detail="<form action='showDetail.jsp' method='post'>"+
        "<input type='hidden' name='xijie' value="+number+">"+
        "<input type='submit' value='查看细节' class='xijie'></form>";
      out.print("<tr align='center'>");
      out.print("<td>"+number+"</td>");
      out.print("<td>"+start+"</td>");
      out.print("<td>"+destination+"</td>");
      out.print("<td>"+price+"</td>");
      out.print("<td>"+detail+"</td>");
      out.print("<td>"+button+"</td>");
      out.print("</tr>");
      boo=rowSet.next();
    }
  }
%>
</table>
<BR>每页最多显示<jsp:getProperty name="dataBean" property="pageSize" />条信息
<BR>当前显示第<Font color=brown>
  <jsp:getProperty name="dataBean" property="currentPage"/>
</Font>页,共有
<Font color=brown><jsp:getProperty name="dataBean" property="totalPages" />
</Font>页.
<Table>
  <tr><td><FORM action="" method=post>
    <Input type=hidden name="currentPage" value="<%=dataBean.getCurrentPage()-1 %>" >
      <Input type=submit name="g" value="上一页" class="shangyiye"></FORM></td>
  <td><FORM action="" method=post>
     <Input type=hidden name="currentPage" value="<%=dataBean.getCurrentPage()+1 %>" >
       <Input type=submit name="g" value="下一页" class="xiayiye"></FORM></td></tr>
  <tr><td><FORM action="" method=post>
  每页显示<Input type=text name="pageSize" value=10 size=3>
  条记录<Input type=submit name="g" value="确定" class="ok"></FORM></td>
  <td><FORM action="" method= post>
    输入页码:<Input type=text name="currentPage" size=2>
    <Input type=submit name="g" value ="提交" class="tijiao"></FORM></td></tr>
</Table>
</Center>
</div>


<div class="footer">
<p align="center"><a href="index.jsp">首页</a> |
<a href="lookTicket.jsp#content">查询车票</a>|
<a href="searchDestination.jsp#content">查询终点</a> |
<a href="Order.jsp#content">查看订单</a> |
<a href="ShoppingCar.jsp#content">我的车票</a>
<br/><br />
Copyright &copy; &nbsp;<a href="index.jsp">南山火车</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;热线：888-520-1314&nbsp;&nbsp;| &nbsp;&nbsp;地址：深圳市南山区华侨城暨南大学深圳旅游学院</p>
</div>
</div>


</BODY ></HTML>
