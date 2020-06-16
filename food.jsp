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
          height: 400px;
      }
    </style>
  </head>
  <body>
    <script>
        function calgain()
        {
            qt = document.getElementById("qt").value;
            ex = document.getElementById("f").value;
            if(ex=="bread"){ cb = 69*qt; }
            else if(ex=="idli"){ cb = 40*qt; }
            else if(ex=="plaindosa"){ cb = 106*qt; }
            else if(ex=="masaladosa"){ cb = 160*qt; }
            else if(ex=="upma"){ cb = 375*qt; }
            else if(ex=="rice"){ cb = 204*qt; }
            else if(ex=="curd"){ cb = 210*qt; }
            else if(ex=="chicbiryani"){ cb = 480*qt; }
            else if(ex=="vegbiryani"){ cb = 169*qt; }
            else if(ex=="sambar"){ cb = 273*qt; }
            else if(ex=="chapathi"){ cb = 68*qt; }
            else if(ex=="paratha"){ cb = 230*qt; }
            else if(ex=="tea"){ cb = 30*qt; }
            else if(ex=="coffee"){ cb = 30*qt; }
            else if(ex=="orangejuice"){ cb = 112*qt; }
            else if(ex=="applejuice"){ cb = 117*qt; }

            document.getElementById("cb").value = cb;
        }
    </script>
    <jsp:include page="nav.jsp" />
    
    <div id="wrapper">
      <div id="first">
        <img id="img" src="hi2.png" class="rounded float-left" alt="...">
      </div>
      <div id="second">
        <br><br>
        <h4>Add your meals here</h4>
        <br>
        <form id="ex" action="food" method="POST">
          <div class="form-group">
            <label for="mt">Meal Time</label>
            <select class="form-control" name="mt" id="mt" placeholder="Please select" required >
                <option value="" selected disabled hidden>Choose here</option>  
                <option value="Breakfast">Breakfast </option>
                <option value="Lunch">Lunch</option>
                <option value="Dinner">Dinner</option>
                <option value="Snacks">Snacks</option>
            </select>
          </div>
          <div class="form-group">
            <label for="f">Food</label>
            <select class="form-control" name="f" id="f" placeholder="Please select" required >
                <option value="" selected disabled hidden>Choose here</option>  
                <option value="bread">Bread </option>
                <option value="idli">Idli</option>
                <option value="plaindosa">Plain Dosa</option>
                <option value="masaladosa">Masala Dosa</option>
                <option value="upma">Upma</option>
                <option value="rice">Rice</option>
                <option value="chicbiryani">Chicken Biryani</option>
                <option value="vegbiryani">Veg Biryani</option>
                <option value="sambar">Sambar</option>
                <option value="curd">Curd</option>
                <option value="chapathi">Chapathi</option>
                <option value="paratha">Paratha</option>
                <option value="tea">Tea</option>
                <option value="coffee">Coffee</option>
                <option value="orangejuice">Orange Juice</option>
                <option value="applejuice">Apple Juice</option>
            </select>
          </div>
          <div class="form-group">
            <label for="qt">Quantity</label>
            <input type="text" class="form-control" name="qt" id="qt" placeholder="Pieces/Cups" required oninput="calgain()">
          </div>
          <div class="form-group">
            <label for="cb">Calories Gained</label>
            <input type="text" class="form-control" name="cb" id="cb" >
          </div>
          <input type="submit" value="Save details" class="btn btn-primary" >
          <input type="hidden" name="uname" value="<%= (String)session.getAttribute("uname") %>">
        </form>
      </div>
    </div>
  </body>
</html>
