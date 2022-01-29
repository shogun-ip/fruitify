<%-- 
    Document   : index
    Created on : Dec 25, 2021, 12:45:19 AM
    Author     : YOMATASHI
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Index</title>
        <style>
            html,
            body {
              height: 100%;
            }

            body {
              align-items: center;
              padding-bottom: 40px;
              background-color: #B6C197;
            }
        </style>
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
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                    <a class="nav-link" href="supplierServlet">Supplier</a>
                    <a class="nav-link" href="#">Promotion</a>
                    <a class="nav-link" href="#">About Us</a>
                    <!-- Sales overview for supplier acc -->
                    <%
                        Account user = (Account)session.getAttribute("account");
                        if(user == null){
                            //
                        }else{
                            if(user.getRole().equals("supplier"))
                                out.println("<a class='nav-link' href='salesOverviewServlet'>Sales Overview</a>");
                        }
                    %>
                    <a class="nav-link" href="LoginServlet">Account</a>
                </div>
              </div>
            </div>
        </nav>
       
        <!-- Home -->
        
        <div id="carouselExampleCaptions" class="carousel slide mx-15 my-15" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="img/i1.jpeg" class="d-block w-100 h-10">
                <div class="carousel-caption d-none d-md-block">
                  <h5>Have a fruit stall?</h5>
                  <p>Juicy fresh fruits for all your customers</p>
                </div>
              </div>
              <div class="carousel-item">
                <img src="img/i2.jpg" class="d-block w-100">
                <div class="carousel-caption d-none d-md-block">
                  <h5>Need supplies?</h5>
                  <p>Near and fast to support demand</p>
                </div>
              </div>
              <div class="carousel-item">
                <img src="img/i3.jpg" class="d-block w-100">
                <div class="carousel-caption d-none d-md-block">
                  <h5>We are your solution</h5>
                  <p>Join the platform now for easy experience!</p>
                </div>
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button> 
        </div>

        <div class="mx-5 py-3">
            <h1>Fruitify</h1>
            <h5>Fruitify is a platform which as a bridge between vendors who sell fruits and suppliers who produce fruits to be sold to customers easily.</h5>
            <p>No more long negotiation with multiple calls, emails and messages. With fruitify you may find both vendor and suppliers which are near to your marketplace.</p>
        </div>
        
    </body>
</html>