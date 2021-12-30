<%-- 
    Document   : registration
    Created on : Dec 29, 2021, 11:12:03 PM
    Author     : faris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Registration</title>
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

            .form-signin {

              display: flex;
              width: 100%;
              max-width: 530px;
              padding: 80px 160px;
              margin: auto;
            }

            .form-signin .form-floating:focus-within {
              z-index: 2;
            }

            .form-signin input {
              margin-bottom: 10px;
              border-bottom-right-radius: 0;
              border-bottom-left-radius: 0;
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
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Supplier</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Promotion</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">About Us</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Account
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                      <li><a class="dropdown-item" href="#">Action</a></li>
                      <li><a class="dropdown-item" href="#">Another action</a></li>
                      <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
        </nav>
        <!--Login-->
        <div class="form-signin">
            <form name="loginForm" method="post" action="LoginServlet">
                <h1 class="h3 mb-3 fw-normal">Logo Here</h1>

                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingFullName" placeholder="Full Name" required>
                  <label for="floatingInput">Full Name</label>
                </div>
                <div class="form-floating">
                  <input type="text" class="form-control" id="floatingDisplay" placeholder="displayname" required>
                  <label for="floatingInput">Display Name</label>
                </div>
                <div class="form-floating">
                  <input type="tel" class="form-control" id="floatingPhone" placeholder="0123456789" required>
                  <label for="floatingInput">Phone Number</label>
                </div>
                <div class="form-floating">
                  <input type="email" class="form-control" id="floatingEmail" placeholder="name@example.com" required>
                  <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating">
                  <input type="password" class="form-control" id="floatingPassword" placeholder="Password" required>
                  <label for="floatingPassword">Password</label>
                </div>
                <div class="checkbox mb-3">
                    <a class="text-decoration-none" href="index.jsp">Log In</a>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign Up</button>
              </form>
        </div>
    </body>
</html>

