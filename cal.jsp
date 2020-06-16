<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import=" java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Alex+Brush&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
          #but{
            border-radius: 25px;
        background: rgb(221, 229, 230);
          padding: 20px; 
          width: 350px;
          height: 200px;
          }
          .btn{
            width: 100%;
          }
        </style>
    </head>
    <body>
            <%
        String uid = (String)session.getAttribute("uname");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb1", "root", "root");
        Statement st=con.createStatement();
        
          ResultSet ress = st.executeQuery("SELECT calb FROM exercise where uname='"+uid+"' order by date desc limit 1");
         if(ress.next())
          {
            Integer h = ress.getInt(1);
            %>
            <h3>Calories Burnt: <%out.println(h);%></h3>
        <% }
        ResultSet res = st.executeQuery("SELECT calg FROM food where uname='"+uid+"' order by date desc limit 1"); %>
        <%  if(res.next())
        {
          Integer g = res.getInt(1);
          %>
          <h3>Calories Gained: <%out.println(g);%></h3>
      <% } 
      ResultSet res1 = st.executeQuery("SELECT bmi FROM bmi where uname='"+uid+"' order by date desc limit 1"); %>
        <%  if(res1.next())
        {
          Integer i = res1.getInt(1);
          %>
          <h3>BMI: <%out.println(i);%></h3>
      <% } %>
      <br><br><br><br><br><br><br><br>
      <h4>Click here to get More Detailed Report:</h4>
      
      <div id="but">
      <a class="btn btn-primary" href="bmi_check.jsp" > Body Mass Index </a><br><br>
      <a class="btn btn-primary" href="ex1.jsp" > Workouts Report </a><br><br>
      <a class="btn btn-primary" href="food1.jsp" > Food Intake Report </a>
      </div>
    </body>
</html>