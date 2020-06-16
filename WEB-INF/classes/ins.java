import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.*;
public class ins extends HttpServlet
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
      String name = request.getParameter("name");
      String uname = request.getParameter("uname");
      String pword = request.getParameter("pword");
      String email = request.getParameter("email");
      String mobile = request.getParameter("mobile");
  		String sql="INSERT INTO login(name,username,password,email,mobile) " + "VALUES(?,?,?,?,?)";
  		PreparedStatement st=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
      st.setString(1,name);
      st.setString(2,uname);
      st.setString(3,pword);
      st.setString(4,email);
      st.setString(5,mobile);
      int rowaffected = st.executeUpdate();
      if(rowaffected==1){
        out.println("Registered Successfully!");
      }
      st.close();
  		con.close();
			Cookie ck=new Cookie("username",uname);//creating cookie object
			response.addCookie(ck);
			HttpSession session=request.getSession(true);
			session.setAttribute("uname",uname);
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
  	}
		catch(Exception e)
		{
			PrintWriter out = response.getWriter();
			out.println(e);
		}
	}
}
