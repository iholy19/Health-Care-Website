import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.*;
import java.lang.Math.*;
public class bmi extends HttpServlet
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
      Double hei = Double.valueOf(request.getParameter("h"))/100;
      Double wei = Double.valueOf(request.getParameter("w"));
      Double b = wei/(hei*hei);
	String sql="INSERT INTO bmi(height,weight,bmi,date,uname) " + "VALUES(?,?,?,?,?)";
	PreparedStatement st=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
      st.setDouble(1,hei);
      st.setDouble(2,wei);
	  st.setDouble(3,b);
	  java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
	  st.setDate(4, sqlDate);
	  st.setString(5,uid);
      int rowaffected = st.executeUpdate();
      if(rowaffected==1){
        out.println("Registered Successfully!");
      }
      st.close();
  	  con.close();
			
			RequestDispatcher rd=request.getRequestDispatcher("bmi_check.jsp");
			rd.forward(request, response);
  	}
		catch(Exception e)
		{
			PrintWriter out = response.getWriter();
			out.println(e);
		}
	}
}
