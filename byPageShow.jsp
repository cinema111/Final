<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="mybean.data.DataByPage" %>
<%@ page import="com.sun.rowset.*" %>
<jsp:useBean id="dataBean" class="mybean.data.DataByPage" scope="session"/>
<HTML>
<head><%@ include file="head.txt" %>
</style></head>
<Body>
<center>
<BR><h3>当前显示的内容是：</h3>
<table border=2>
<tr>
    <th>票号</th>
    <th>电影名</th>
    <th>导演</th>
    <th>日期</th>
    <th>票价</th>
    <th>查看详情</th>
    <th>添加到购物车</th>
</tr>
<jsp:setProperty name="dataBean" property="pageSize" param="pageSize"/>
<jsp:setProperty name="dataBean" property="currentPage" param="currentPage"/>
<%
  CachedRowSetImpl rowSet=dataBean.getRowSet();
  if(rowSet==null){
    out.print("抱歉，没有相关播放场次"+"<br/>");
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
      String director=rowSet.getString(3);
      String date=rowSet.getString(4);
      String price=rowSet.getString(5);
      String goods="("+number+","+name+","+director+","+date+","+price+")#"+price;
      goods=goods.replaceAll("\\p{Blank}","");
      String button="<form action='putGoodsServlet' method='post'>"+
        "<input type='hidden' name='java' value="+goods+">"+
        "<input type='submit' value='放入购物车' class='putincar'></form>";
      String detail="<form action='showDetail.jsp' method='post'>"+
        "<input type='hidden' name='xijie' value="+number+">"+
        "<input type='submit' value='查看细节' class='xijie'></form>";
      out.print("<tr align='center'>");
      out.print("<td>"+number+"</td>");
      out.print("<td>"+name+"</td>");
      out.print("<td>"+director+"</td>");
      out.print("<td>"+date+"</td>");
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
</BODY ></HTML>
