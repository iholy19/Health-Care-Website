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
      #bmi{
        border-radius: 25px;
          background: rgb(221, 229, 230);
          padding: 20px; 
          width: 600px;
          height: 220px;
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
        <h4>Check your BMI here</h4>
        <br>
        <form id="bmi" action="bmi" method="POST">
          <div class="form-group">
            <label for="height">Height</label>
            <input type="text" class="form-control" name="h" id="height" placeholder="Enter Height in CMs" required>
          </div>
          <div class="form-group">
            <label for="weight">Weight</label>
            <input type="text" class="form-control" name="w" id="weight" placeholder="Enter weight in KGs" required>
          </div>
          <input type="submit" value="Check Now" class="btn btn-primary" >
          <input type="hidden" name="uname" value="<%= (String)session.getAttribute("uname") %>">
        </form>
      </div>
    </div>
  </body>
</html>
