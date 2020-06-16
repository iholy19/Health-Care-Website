import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.*;
import java.lang.Math.*;
public class food extends HttpServlet
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
      String meal= request.getParameter("mt");
      String food = request.getParameter("f");
      Integer q = Integer.valueOf(request.getParameter("qt"));
      Integer cb = Integer.valueOf(request.getParameter("cb"));
      String sql="INSERT INTO food(time,food,quantity,calg,uname,date)" + "VALUES(?,?,?,?,?,?)";
      PreparedStatement st=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
      st.setString(1,meal);
      st.setString(2,food);
      st.setInt(3,q);
	  st.setInt(4,cb);
      st.setString(5,uid);
	  java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
	  st.setDate(6, sqlDate);
	  
      int rowaffected = st.executeUpdate();
      if(rowaffected==1){
        out.println("Registered Successfully!");
      }
      st.close();
  	  con.close();
			
			RequestDispatcher rd=request.getRequestDispatcher("food1.jsp");
			rd.forward(request, response);
  	}
		catch(Exception e)
		{
			PrintWriter out = response.getWriter();
			out.println(e);
		}
	}
}
