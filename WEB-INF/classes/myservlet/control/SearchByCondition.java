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
      fail(request,response,"没有查询信息,无法查询");
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
        dataBean=new DataByPage();    //创建 Javabean对象
        session.setAttribute("dataBean",dataBean);
      }
    }
    catch(Exception exp){
      dataBean=new DataByPage();    //创建 Javabean对象
      session.setAttribute("dataBean",dataBean);
    }
    String url="jdbc:mysql://127.0.0.1/cinema?"+"user=root&password=&characterEncoding=gb2312&serverTimezone=UTC";
    try{
      con= DriverManager.getConnection(url);
      Statement sql= con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
      ResultSet rs= sql.executeQuery(condition);
      rowSet= new CachedRowSetImpl();   //创建行集对象
      rowSet.populate(rs);
      dataBean.setRowSet(rowSet);   //行集数据存储在 dataBean中
      con.close();    //关闭连接
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
      out.println("返回:");
      out.println("<a href=searchTicket.jsp>查询电影</a>");
      out.println("</body></html>");
    }
    catch(IOException exp){}
  }
}
