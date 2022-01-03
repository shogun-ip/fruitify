<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    	<head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Manage Product</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
        <style>@import url(https://fonts.googleapis.com/css?family=Roboto:300,400,700&display=swap);

            body {
            font-family: "Roboto", sans-serif;
            background-color: #B6C197;
            min-height: 100vh;
            position: relative;
            } 


            .content-table {
              border-collapse: collapse;
              margin: 25px 0;
              font-size: 0.9em;
              min-width: 1400px;
              border-radius: 5px 5px 0 0;
              overflow: hidden;
              box-shadow: 0 0 25px rgba(0, 0, 0, 0.15);
            }

            .content-table thead tr {
              background-color: #009879;
              color: #ffffff;
              text-align: left;
              font-weight: bold;
            }

            .content-table th,
            .content-table td {
              padding: 12px 15px;
            }

            .content-table tbody tr {
              border-bottom: 1px solid #dddddd;
            }

            .content-table tbody tr:nth-of-type(even) {
              background-color: #f3f3f3;
            }

            .content-table tbody tr:last-of-type {
              border-bottom: 2px solid #009879;
            }

            .content-table tbody tr.active-row {
              font-weight: bold;
              color: #009879;
            }
        </style>
		<script type='text/javascript' src=''></script>
		<script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
		<script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
		<script type='text/javascript'></script>
	</head>
    <body>
        <!--Navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #8A9B68;">
            <div class="container-fluid">
              <a class="navbar-brand" href="index.jsp">Fruitify</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <div class="navbar-nav">
                    <a class="nav-link" href="index.jsp">Home</a>
                    <a class="nav-link" href="supplierServlet">Supplier</a>
                    <a class="nav-link" href="#">Promotion</a>
                    <a class="nav-link" href="#">About Us</a>
                    <a class="nav-link" href="login.jsp">Account</a>
                </div>
              </div>
            </div>
        </nav>
        
        <div class="container">
            <div class="row">
                <table class="content-table">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Photo</th>
                        <th>Fruit Name</th>
                        <th> Fruit Type</th>
                        <th>Price</th>
                        <th>Weightage</th>
                        <th>Availability</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th>1</th>
                        <th> <img src="img/banana.png" alt="banana" width="100" height="80"></th> 
                        <th>Banana</th>
                        <th> Local</th>
                        <th>RM4.90</th>
                        <th>+/- 1kg</th>
                        <th>30</th>
                        <th><input type="submit" value="Delete"></th>
                        <th><input type="submit" value="Edit"></th>
                     </tr>
                      <tr>
                        <th>2</th>
                        <th><img src="img/pineapple.png" alt="pineapple" width="100" height="80"></th>
                        <th>Pineapple</th>
                        <th> Local</th>
                        <th>RM5.00</th>
                        <th>+/- 1.2kg</th>
                        <th>20</th>
                        <th><input type="submit" value="Delete"></th>
                        <th><input type="submit" value="Edit"></th>
                      </tr>
                      <tr>
                        <th>3</th>
                        <th><img src="img/watermelon.png" alt="watermelon" width="100" height="80"></th>
                        <th>Watermelon</th>
                        <th> Local</th>
                        <th>RM2.29</th>
                        <th>+/- 1kg</th>
                        <th>40</th>
                        <th><input type="submit" value="Delete"></th>
                        <th><input type="submit" value="Edit"></th>
                      </tr>
                      <tr>
                        <th>4</th>
                        <th><img src="img/mangosteen.png" alt="mangosteen" width="100" height="80"></th>
                        <th>Mangosteen</th>
                        <th> Local</th>
                        <th>RM11.90</th>
                        <th>+/- 1kg</th>
                        <th>100</th>
                        <th><input type="submit" value="Delete"></th>
                        <th><input type="submit" value="Edit"></th>
                      </tr>
                      <tr>
                        <th>5</th>
                        <th><img src="img/red apple.png" alt="apple" width="100" height="80"></th>
                        <th>Red Apple</th>
                        <th> Imported</th>
                        <th>RM1.05</th>
                        <th>each</th>
                        <th>120</th>
                        <th><input type="submit" value="Delete"></th>
                        <th><input type="submit" value="Edit"></th>
                      </tr>
                      <tr>
                        <th>6</th>
                        <th><img src="img/greenapple.png" alt="greenapple" width="100" height="80"></th>
                        <th>Green Apple</th>
                        <th> Imported</th>
                        <th>RM1.10</th>
                        <th>each</th>
                        <th>135</th>
                        <th><input type="submit" value="Delete"></th>
                        <th><input type="submit" value="Edit"></th>
                      </tr>
                    </tbody>
                  </table>
            </div>
        </div>
   	     	       
    </body>
</html>
<!DOCTYPE html><html><head><link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet" /><link href="./css/main.css" rel="stylesheet" /><title>Document</title></head>
