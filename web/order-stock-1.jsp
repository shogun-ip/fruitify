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
		<title>Product page</title>
		<link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
		<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
		<style>@import url(https://fonts.googleapis.com/css?family=Roboto:300,400,700&display=swap);

                   body {
                        font-family: "Roboto", sans-serif;
                        background-color: #B6C197;
                        min-height: 100vh;
                        position: relative;
                        } 
                    .section{
                        width: 100%;
                        min-height: 100vh;
                        background-color: #B6C197; 
                    }
                    .cards{
                        width: 100%;
                        display:flex;
                        flex-wrap:wrap;
                        justify-content:center;
                        align-items: center;
                        margin:auto;
                    }
                    
                    .card{
                        display:flex;
                        justify-content: center;
                        align-items:center;
                        flex-direction:column;
                        box-shadow: 0px 2px 4px rgb(0,0,0,25%);
                        width:325px;
                        text-align: center;
                        margin:25px;
                        cursor:ponter;
                        background-color: #fff;
                    }
                    .image-section{
                        width:100%;
                        display:flex;
                        justify-content: center;
                        align-items: center;
                    }
                    .image-section img{
                        width:200px;
                        height:180;
                    }
                    .description{
                        text-align:center;
                        margin-top: 20px;
                    }
                    .description h1{
                        font-size:20px;
                        text-transform:uppercase;
                        color:#222;
                        letter-spacing: 2px;
                        margin-top:10px;
                        
                    }
                    .description p{
                        font-size: 17px;
                        letter-spacing: 1.5px;
                        margin-top:10px;
                        
                    }
                    .description span{
                        margin-left: 8px;
                    }
                    .button-group{
                        margin-top: 30px;
                    }
                    .button-group.view:hover{
                        background-color: #0b348d;
                        transition: 0.6s ease;
                    }
                    .button-group .view{
                       background-color: #8A9B68;
                       font-size:14px;
                       padding:8px 20px;
                       border-radius: 5px;
                       text-decoration: none;
                       letter-spacing: 1px;
                       color:#fff;
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
        
        <div class="section">
            <div class="cards">
               
                <div class="card">
                    <div class="image-section">
                        <img src="img/banana.png">
                    </div>
                    <div class="description">
                        <h1> Banana </h1>
                        <p><b> RM4.90</b><span>+/-1kg</span></p>
                    </div>
                    <div class="button-group">
                        <a href="" class="view">View</a>
                    </div>
                </div>
                <div class="card">
                    <div class="image-section">
                        <img src="img/papaya.png">
                    </div>
                    <div class="description">
                        <h1> Papaya </h1>
                        <p><b> RM5.90</b><span>each</span></p>
                    </div>
                    <div class="button-group">
                        <a href="" class="view">View</a>
                    </div>
                </div>
                <div class="card">
                    <div class="image-section">
                        <img src="img/pineapple.png">
                    </div>
                    <div class="description">
                        <h1> Pineapple </h1>
                        <p><b> RM5.00</b><span>+/-1.5kg</span></p>
                    </div>
                    <div class="button-group">
                        <a href="" class="view">View</a>
                    </div>
                </div>
                <div class="card">
                    <div class="image-section">
                        <img src="img/watermelon.png">
                    </div>
                    <div class="description">
                        <h1> Watermelon </h1>
                        <p><b> RM2.29</b><span>+/-1kg</span></p>
                    </div>
                    <div class="button-group">
                        <a href="" class="view">View</a>
                    </div>
                </div>
                <div class="card">
                    <div class="image-section">
                        <img src="img/greenapple.png">
                    </div>
                    <div class="description">
                        <h1>Green Apple </h1>
                        <p><b> RM1.10</b><span>each</span></p>
                    </div>
                    <div class="button-group">
                        <a href="" class="view">View</a>
                    </div>
                </div>
                <div class="card">
                    <div class="image-section">
                        <img src="img/mangosteen.png">
                    </div>
                    <div class="description">
                        <h1>Mangosteen </h1>
                        <p><b> RM11.90</b><span>+/-1kg</span></p>
                    </div>
                    <div class="button-group">
                        <a href="" class="view">View</a>
                    </div>
                </div>
                <div class="card">
                    <div class="image-section">
                        <img src="img/durian.jpg">
                    </div>
                    <div class="description">
                        <h1>Durian </h1>
                        <p><b> RM15.00 </b><span>+/-1kg</span></p>
                    </div>
                    <div class="button-group">
                        <a href="" class="view">View</a>
                    </div>
                </div>
                <div class="card">
                    <div class="image-section">
                        <img src="img/red apple.jpg">
                    </div>
                    <div class="description">
                        <h1>Red Apple </h1>
                        <p><b> RM1.10</b><span>each</span></p>
                    </div>
                    <div class="button-group">
                        <a href="" class="view">View</a>
                    </div>
                </div>
                    
            </div>
        </div>
    </body>
</html>
