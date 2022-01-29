<%-- 
    Document   : login
    Created on : Dec 31, 2021, 6:46:04 PM
    Author     : YOMATASHI
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Login</title>
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
              max-width: 330px;
              padding: 150px 15px 15px 60px;
              margin: auto;
            }
            
            .error-msg{
                display: flex;
                width: 100%;
                max-width: 330px;
                padding: 0px 15px 15px 15px;
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
                <div class="navbar-nav">
                    <a class="nav-link" href="index.jsp">Home</a>
                    <a class="nav-link" href="supplierServlet">Supplier</a>
                    <!-- My orders for vendor -->
                    <%
                        Account user = (Account)session.getAttribute("account");
                        if(user == null){
                            //
                        }else{
                            if(user.getRole().equals("vendor"))
                                out.println("<a class='nav-link' href='paymentHistory'>My order</a>");
                        }
                    %>
                    <a class="nav-link active" aria-current="page" href="LoginServlet">Account</a>
                </div>
              </div>
            </div>
        </nav>
        
        <!--Login-->
        <div class="form-signin">
            <form name="loginForm" method="post" action="LoginServlet">
                <h1 class="h3 mb-3 fw-normal">Logo Here</h1>

                <div class="form-floating">
                    <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com" required>
                    <label for="email">Email address</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                    <label for="password">Password</label>
                </div>
                <div class="checkbox mb-3">
                    <a class="text-decoration-none" href="registration.jsp">Sign Up</a>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Log In</button>
              </form>
        </div>
    </body>
</html>
