<%@ page contentType = "text/html;charset=gb2312" %>
<jsp:useBean id = "loginBean" class= "mybean.data.Login" scope= "session"/>
<HTML>
<head><style type="text/css">
@import url("css/common.css");

</style>
</head>

<body>
<div id="body_warpper">
<div class="header">
 <ul>
    <li><a href="exitServlet">�˳�</a></li>
    <li><a href="inputRegisterMess.jsp#content">ע��</a></li>
    <li><a href="login.jsp#content">��¼</a></li>
  </ul>
<div class="zhongjian"> <h1>��ɽ��վ</h1></div>


<div align="center" class="daohang">
<ul>

  <li><a href="index.jsp">��ҳ</a></li>
   <li><a href="lookCosmetic.jsp#content">����鼮</a>
    <ul><a href="#">������</a></ul>
    <ul><a href="#">ͼ��</a></ul>
</li>
  <li><a href="searchCosmetic.jsp#content">��ѯ�鼮</a></li>
  <li><a href="lookOrderForm.jsp#content">�鿴����</a></li>
  <li><a href="lookShoppingCar.jsp#content">�ҵĹ��ﳵ</a></li>
</ul>
</div>

</div>


<div id="content">

   <div class="denglu" align="center">
   <br/><br/>
   <h1 align="center">��¼</h1>
   <table border = 2>
   <FORM action ="loginServlet" Method ="post">
   <tr><td>��¼���ƣ�<Input type=text name="logname"></td></tr>
   <tr><td>�������룺<Input type=password name="password"></td></tr>
   </table>
   <br/>
<Input type=submit name="g" value ="�ύ" class="submit">
   </form> </div>

<br/><br/>
<div align ="center">
    ��¼������Ϣ��<jsp:getProperty name="loginBean" property="backNews"/>
    <br>��¼���ƣ�<jsp:getProperty name="loginBean" property="logname"/>
</div>
</div>


<div class="footer">

    <p align="center"><a href="index.jsp">��ҳ</a> | 
<a href="lookTicket.jsp#content">��ѯ��Ʊ</a>|
<a href="searchDestination.jsp#content">��ѯ�յ�</a> |
<a href="Order.jsp#content">�鿴����</a> |
<a href="ShoppingCar.jsp#content">�ҵĳ�Ʊ</a>
     <br />
     <br />
           Copyright &copy; &nbsp;<a href="index.jsp">��ɽ��վ</a>&nbsp;&nbsp;2018&nbsp;&nbsp;| &nbsp;&nbsp;���ߣ�808-100-2010&nbsp;&nbsp;| &nbsp;&nbsp;��ַ����������ɽ�����ȳ����ϴ�ѧ��������ѧԺ</p>
  </div>
</div>
</body></HTML>
