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
      #ex{
        border-radius: 25px;
          background: rgb(221, 229, 230);
          padding: 20px; 
          width: 600px;
          height: 300px;
      }
    </style>
  </head>
  <body>
    <script>
        function calburnt()
        {
            dur = document.getElementById("dur").value;
            ex = document.getElementById("Exercise").value;
            if(ex=="walking"){ cb = 8*dur; }
            else if(ex=="running"){ cb = dur*18 }
            else if(ex=="cycling"){ cb = dur*15 }
            else if(ex=="swimming"){ cb = dur*17 }
            else if(ex=="aerobics"){ cb = dur*11 }
            else if(ex=="yoga"){ cb = dur*10 }
            document.getElementById("cb").value = cb;
        }
    </script>
    <jsp:include page="nav.jsp" />
    <div id="wrapper">
      <div id="first">
        <img id="img" src="hi2.png" class="rounded float-left" alt="...">
      </div>
      <div id="second">
        <br><br><br>
        <h4>Add your recent workouts</h4><br>
    <form id="ex" action="exercise" method="POST">
      <div class="form-group">
        <label for="Exercise">Exercise</label>
        <select class="form-control" name="ex" id="Exercise" placeholder="Please select" required >
            <option value="" selected disabled hidden>Choose here</option>  
            <option value="walking">Walking</option>
            <option value="running">Running</option>
            <option value="cycling">Bicycling</option>
            <option value="swimming">Swimming</option>
            <option value="aerobics">Aerobics</option>
            <option value="yoga">Yoga</option>
        </select>
      </div>
      <div class="form-group">
        <label for="Duration">Duration</label>
        <input type="text" class="form-control" name="dur" id="dur" placeholder="Enter in Mins" required oninput="calburnt()">
      </div>
      <div class="form-group">
        <label for="cb">Calories Burnt</label>
        <input type="text" class="form-control" name="cb" id="cb" >
      </div>
      <input type="submit" value="Save details" class="btn btn-primary" >
      <input type="hidden" name="uname" value="<%= (String)session.getAttribute("uname") %>">
    </form>
      </div>
    </div>
  </body>
</html>
