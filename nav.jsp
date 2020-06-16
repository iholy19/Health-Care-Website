<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Alex+Brush&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </head>
    <style>
        .nav li:hover{
            background-color: #f05353 ;
            color: black;
        }
        #font{
            font-family: 'Alex Brush', cursive;
            font-style: Bold;
            font-size: 32px;
        }
        #font1{
            font-family: 'Alex Brush', cursive;
            font-size: 30px;
        }
        #logo{
            height: 37px;
            vertical-align: middle;
            margin-left: 40px;
            border-radius: 50%;
        }

    </style>
    <body>
        <% String uid = (String)session.getAttribute("uname"); %>
        <nav class="navbar navbar-inverse navbar-expand-lg py-md-3" >
            <div class="container-fluid">
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">
                  <strong><span id='font'><img id="logo" src="img/logo.png" alt="logo"></span> </strong>
                  <strong><span id='font'>Z-</span> </strong>
                  <strong><span id='font1'>fit</span> </strong>
                </a>
              </div>
              <div class="collapse navbar-collapse" id="myNavbar">
                
                <ul class="nav navbar-nav navbar-right">
                    
                    <% if(uid!=null){
                        %>
                    <li><a href="bmi.jsp">Check BMI</a></li>
                    <li><a href="food.jsp">Food</a></li>
                    <li><a href="ex.jsp">Exercise</a></li>
                    <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span>Log out</a></li>
                    <li><a href="index.jsp">Welcome,<%=(String)session.getAttribute("uname")%></a></li>
                    <% } %>
                    <% if(uid==null){
                     %>
                    <li><a href="index.jsp#signup"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
                    <li><a href="index.jsp#signin"><span class="glyphicon glyphicon-log-in"></span>Log in</a></li>
                    <% }  %>
                    
              </div>
            </div>
          </nav>
    </body>
</html>