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
          #wrapper {
              width: 1100px;
              /* border: 1px solid black; */
              overflow: hidden; /* add this to contain floated children */
          }
          #first {
              width: 500px;
              float:left; /* add this */
              /* border: 1px solid red; */
               
          }
          #second {
              width: 600px;
              /* border: 1px solid green; */
              float: left; /* add this */
          }
          #img{
            height: 600px;
            padding-left: 100px;;
          }
          
        </style>
    </head>
    <body>
        
        <jsp:include page="nav.jsp" />
       
        <div id="wrapper">
          <div id="first">
            <img id="img" src="hi2.png" class="rounded float-left" alt="...">
          </div>
          <div id="second">
            <br><br><br>
            <h4>BMI report</h4>
            <table id="bmi" class="table">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">Date</th>
                  <th scope="col">Height</th>
                  <th scope="col">Weight</th>
                  <th scope="col">BMI</th>
                  <th scope="col">Result</th>
                </tr>
              </thead>
              <%
          String uid = (String)session.getAttribute("uname");
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb1", "root", "root");
          Statement st=con.createStatement();
          Integer i = 0;
            ResultSet ress = st.executeQuery("SELECT * FROM bmi where uname='"+uid+"' order by date");
            while(ress.next())
            {
              Double h = ress.getDouble(1);
              Double w = ress.getDouble(2);
              Double b = ress.getDouble(3);
              Date d = ress.getDate(4);
             i = i+1; 
              %>
              <tbody>
                <tr>
                  <th scope="row"><%out.println(i);%></th>
                  <td><%out.println(d);%></td>
                  <td><%out.println(h);%></td>
                  <td><%out.println(w);%></td>
                  <td><%out.println(b);%></td>
                  <% if(b<18){ %> <td><%out.println("Lean");%></td>
                  <% } else if(b>=18 && b<=24) { %> <td><%out.println("Normal");%></td> 
                  <% } else { %> <td><%out.println("Obese");}%></td>
                </tr>
                <% } %>
              </tbody>
            </table>
          </div>
        </div>
    </body>
</html>