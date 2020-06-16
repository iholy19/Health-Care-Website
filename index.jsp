<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Parisienne&display=swap" rel="stylesheet">
    <style>
      #wrapper {
          width: 1500px;
          /* border: 1px solid black; */
          overflow: hidden; /* add this to contain floated children */
      }
      #first {
          width: 800px;
          float:left; /* add this */
          /* border: 1px solid red; */

      }
      #second {
          width: 350px;
          /* border: 1px solid green; */
          float: left; /* add this */
      }
      #font{
        font-family: 'Parisienne', cursive;

      }
      #signin{
        border-radius: 25px;
          background: rgb(221, 229, 230);
          padding: 20px;
          width: 350px;
          height: 230px;
      }
      #signup{
        border-radius: 25px;
        background: rgb(221, 229, 230);
          padding: 20px;
          width: 350px;
          height: 480px;
      }
      #cal{
        border-radius: 25px;
        background: rgb(221, 229, 230);
          padding: 20px;
          width: 350px;
          height: 185px;

      }
  </style>
</head>
    <body>
        <jsp:include page="nav.jsp" />
        <script src="js/log.js"> </script>
        <script src="js/ajax.js"> </script>
          <div id="wrapper">
            <div id="first">
              <img src="hi1.png" class="rounded float-left" alt="...">
            </div>


          <div id="second">
            <h1 id="font">Stay Fit!   Stay Healthy!</h1>
            <br>
            <% String uid = (String)session.getAttribute("uname");
            if(uid!=null){ %>
            <h4>Your last report:</h4>
            <div id="cal">
              <jsp:include page="cal.jsp" />
            </div>
            <% } %>
            <%
            if(uid==null){ %>
            <h4>Log-In to continue</h4>
            <form id="signin" action="login" method="POST">
              <div class="form-group">
                <label for="height">Username</label>
                <input type="text" class="form-control" name="username" id="height" placeholder="Enter username" required>
              </div>
              <div class="form-group">
                <label for="weight">Password</label>
                <input type="password" class="form-control" name="pass" id="weight" placeholder="Enter password" required>
              </div>
              <input type="submit" value="Sign In" name="signin" class="btn btn-primary" >
              </form>
              <br><br><br>
              <h4>Sign Up to continue</h4>
              <form id="signup" action="ins" method="POST">
                <div class="form-group">
                  <label for="height">Name</label>
                  <input type="text" class="form-control" name="name" id="height" placeholder="Enter your name" required>
                </div>
                <div class="form-group">
                  <label for="weight">Username</label>
                  <input type="text" class="form-control" name="uname" id="weight" placeholder="Create username" required onkeyup="loadXMLDoc()"><span id="err"> </span>
                </div>
                <div class="form-group">
                    <label for="weight1">Password</label>
                    <input type="password" class="form-control" name="pword" id="weight1" placeholder="Create password" required>
                  </div>
                  <div class="form-group">
                    <label for="weight2">E-mail</label>
                    <input type="email" class="form-control" name="email" id="weight2" placeholder="Enter your E-mail id" required>
                  </div>
                  <div class="form-group">
                    <label for="weight3">Mobile Number</label>
                    <input type="text" class="form-control" name="mobile" id="weight3" placeholder="Enter your mobile number" required>
                  </div>

                <input type="submit" value="Submit" name="signup" onclick="return myformvalids()" class="btn btn-primary" >
                <input type="reset" value="Reset" name="reset" class="btn btn-primary" >

              </form>
          </div>
          </div>



    <% } %>
    </body>
</html>
