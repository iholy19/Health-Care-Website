import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.*;
import java.lang.Math.*;
public class exercise  extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
    Connection con=null;
		try{
      String docType ="<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
      PrintWriter out=response.getWriter();
  		Class.forName("com.mysql.jdbc.Driver");
  		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb1","root","root");
      if(con!=null){
          out.println("Successfully Connected!");
      }
	  String uid = request.getParameter("uname");
      String exe= request.getParameter("ex");
      
      Integer dur = Integer.valueOf(request.getParameter("dur"));
      Integer cb = Integer.valueOf(request.getParameter("cb"));
      String sql="INSERT INTO exercise(ex,dur,calb,uname,date)" + "VALUES(?,?,?,?,?)";
      PreparedStatement st=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
      st.setString(1,exe);
      st.setInt(2,dur);
	  st.setInt(3,cb);
      st.setString(4,uid);
	  java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
	  st.setDate(5, sqlDate);
	  
      int rowaffected = st.executeUpdate();
      if(rowaffected==1){
        out.println("Registered Successfully!");
      }
      st.close();
  	  con.close();
			
			RequestDispatcher rd=request.getRequestDispatcher("ex1.jsp");
			rd.forward(request, response);
  	}
		catch(Exception e)
		{
			PrintWriter out = response.getWriter();
			out.println(e);
		}
	}
}
