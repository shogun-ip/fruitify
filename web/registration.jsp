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
              max-width: 700px;
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
        <script>
            function validateForm() {
                let x = document.forms["loginForm"]["Region"].value;
                if (x == "Region") {
                  alert("Choose a region");
                  return false;
                }
            }
        </script>
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
                    <a class="nav-link active" aria-current="page" href="LoginServlet">Account</a>
                </div>
              </div>
            </div>
        </nav>
        
        <!--Login-->
        <div class="form-signin">
            <form name="loginForm" method="post" action="RegisterServlet" onsubmit="return validateForm()">
                <h1 class="h3 mb-3 fw-normal">Logo Here</h1>

                <div class="form-floating">
                  <input type="text" class="form-control" id="FullName" name="FullName" placeholder="Full Name" required>
                  <label for="FullName">Full Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="Phone" name="phoneNum" placeholder="0123456789" required>
                  <label for="Phone">Phone Number</label>
                </div>
                <div class="form-floating mb-2">
                    <textarea class="form-control" id="Address" name="Address" placeholder="Address" required></textarea>
                  <label for="Address">Address</label>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="Postcode" name="Postcode" placeholder="Postcode" required>
                          <label for="Postcode">Postcode</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="City" name="City" placeholder="City" required>
                          <label for="City">City</label>
                        </div>
                    </div>
                </div>
                <select class="form-select mb-2" aria-label="Region" name="Region">
                    <option selected disabled>Region</option>
                    <option value="Northern">Northern Region (Perlis, Kedah, Penang, Perak)</option>
                    <option value="East Coast">East Coast Region (Kelantan, Terengganu, Pahang)</option>
                    <option value="Central">Central Region (Selangor, Kuala Lumpur, Putrajaya)</option>
                    <option value="Southern">Southern Region (Negeri Sembilan, Melaka, Johor)</option>
                </select>
                <div class="form-floating">
                    <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
                  <label for="email">Email address</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="Password" name="Password" placeholder="Password" required>
                  <label for="Password">Password</label>
                </div>
                <div class="checkbox mb-3">
                    <a class="text-decoration-none" href="login.jsp">Log In</a>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign Up</button>
              </form>
        </div>
    </body>
</html>

