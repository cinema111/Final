
<%@ page contentType="text/html;charset=gb2312"%>
<HTML><HEAD><%@ include file="head.txt"%></HEAD>
<BODY background=image/happy.jpg><Font size=2>
<div align=center>
<br>��ѯʱ���������Ӱ�������������Ӱ����.<br>
��Ӱ���͵���������֧��ģ����ѯ
<br>��Ӱ�����밴2000-12-24�ĸ�ʽ����<br>
<FORM action="searchByConditionServlet" Method="post">
<br>�����ѯ��Ϣ:<Input type=text name="searchMess"><br>
<input type=radio name="radio" value="film_name" checked="ok">��Ӱ��
<Input type=radio name="radio" value="director">��������
<Input type=radio name="radio" value="date">��Ӱ����
<br><Input type=submit name="g" value="��ѯ">
</Form>
</div>
</Font></BODY></HTML>
