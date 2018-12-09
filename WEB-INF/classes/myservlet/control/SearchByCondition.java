package myservlet.control;
import mybean.data.DataByPage;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class SearchByCondition extends HttpServlet{
  CachedRowSetImpl rowSet= null;
  public void init(ServletConfig config) throws ServletException{
    super.init(config);
    try{
      Class.forName("com.mysql.jdbc.Driver");
    }
    catch(Exception e){}
  }
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
    request.setCharacterEncoding("gb2312");
    String searchMess= request.getParameter("searchMess");
    String radioMess= request.getParameter("radio");
    if(searchMess== null||searchMess.length()==0){
      fail(request,response,"û�в�ѯ��Ϣ,�޷���ѯ");
      return;
    }
    String condition="";
    if(radioMess.equals("director")){
      condition= "SELECT * FROM ticket where director LIKE '%"+searchMess+"%'";
    }
    else if(radioMess.equals("film_name")){
      condition= "SELECT * FROM ticket where fname LIKE '%"+searchMess+"%'";
    }
    else if(radioMess.equals("date")){
      condition= "SELECT * FROM ticket where date = '"+searchMess+"'";
    }
    HttpSession session=request.getSession(true);
    Connection con= null;
    DataByPage dataBean= null;
    try{
      dataBean= (DataByPage)session.getAttribute("dataBean");
      if(dataBean== null){
        dataBean=new DataByPage();    //���� Javabean����
        session.setAttribute("dataBean",dataBean);
      }
    }
    catch(Exception exp){
      dataBean=new DataByPage();    //���� Javabean����
      session.setAttribute("dataBean",dataBean);
    }
    String url="jdbc:mysql://127.0.0.1/cinema?"+"user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";
    try{
      con= DriverManager.getConnection(url);
      Statement sql= con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
      ResultSet rs= sql.executeQuery(condition);
      rowSet= new CachedRowSetImpl();   //�����м�����
      rowSet.populate(rs);
      dataBean.setRowSet(rowSet);   //�м����ݴ洢�� dataBean��
      con.close();    //�ر�����
    }
    catch(SQLException exp){}
    response.sendRedirect("byPageShow.jsp");
  }
  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
    doPost(request,response);
  }
  public void fail(HttpServletRequest request,HttpServletResponse response,String backNews){
    response.setContentType("text/html;charset=gb2312");
    try{
      PrintWriter out= response.getWriter();
      out.println("<html><body>");
      out.println("<h2>"+backNews+"</h2>");
      out.println("����:");
      out.println("<a href=searchTicket.jsp>��ѯ��Ӱ</a>");
      out.println("</body></html>");
    }
    catch(IOException exp){}
  }
}
