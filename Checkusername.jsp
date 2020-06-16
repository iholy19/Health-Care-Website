
<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String sn=request.getParameter("ver");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb1", "root", "root");
    Statement st=con.createStatement();
    ResultSet rs = st.executeQuery("select * from login where username='"+sn+"'"); // this is for name
    if(rs.next())
    {
        out.println("<font color=red>");
        out.println("&#10006;");
        out.println("</font>");
    }
    else {
        out.println("<font color=green>");
        out.println("&#10004;");
        out.println("</font>");
    }
    rs.close();
    st.close();
    con.close();
%>
