import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class check extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection con=null;
		try{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String u=request.getParameter("username");
			String p=request.getParameter("pass");
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb1","root","root");
			if(con==null){
					out.println("Not Connected!");
			}
			Statement st=con.createStatement();
	    ResultSet rs = st.executeQuery("select * from login where username='"+u+"'");
			if(rs.next())
			{
				String unamedb=rs.getString(2);
				String passdb=rs.getString(3);
				if(p.equals(passdb)){
					Cookie ck=new Cookie("username",u);
    			response.addCookie(ck);
					HttpSession session=request.getSession(true);
					//session.setMaxInactiveInterval(10);
        	session.setAttribute("uname",u);
					RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
				}

			}
			else{
				out.print("Sorry username or password error!");
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
			}
		}
		catch(Exception e)
		{
			PrintWriter out = response.getWriter();
			out.println(e);
		}
	}

}
