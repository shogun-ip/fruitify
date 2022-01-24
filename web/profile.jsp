<%-- 
    Document   : profile
    Created on : Jan 4, 2022, 12:49:30 AM
    Author     : faris
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Profile</title>
        <script>
            function validateForm() {
                let x = document.forms["loginForm"]["Region"].value;
                if (x == "Region") {
                  alert("Choose a region");
                  return false;
                }
            }
        </script>
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

            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8
            }

            .profile-button {
                background: rgb(99, 39, 120);
                box-shadow: none;
                border: none
            }

            .profile-button:hover {
                background: #682773
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none
            }

            .back:hover {
                color: #682773;
                cursor: pointer
            }

            .labels {
                font-size: 11px
            }

            .add-experience:hover {
                background: #BA68C8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #BA68C8
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
                    <a class="nav-link" href="#">Promotion</a>
                    <a class="nav-link" href="#">About Us</a>
                    <a class="nav-link active" aria-current="page" href="LoginServlet">Account</a>
                </div>
              </div>
            </div>
        </nav>
        
        <% 
            Account user = (Account)session.getAttribute("account"); 

            if(user == null){
                out.println("<p>Please <a href='login.jsp'>log in</a> first.</p>");
            }else{
                    out.println("<div class='container rounded bg-white mt-5 mb-5'>");
                    out.println("<div class='row'>");
                        out.println("<form name='loginForm' method='post' action='UpdateServlet'>");
                            out.println("<div class='col-md-6'>");
                                out.println("<div class='p-3 py-5'>");
                                    out.println("<div class='d-flex justify-content-between align-items-center mb-3'>");
                                        out.println("<h4 class='text-right'>Profile</h4>");
                                    out.println("</div>");
                                    out.println("<div class='row mt-2'>");
                                        out.println("<div class='col-md-20'><label class='labels'>Full Name</label><input type='text' name='FullName' class='form-control' placeholder='Full Name' value='"
                                                + user.getName()
                                                + "'></div>");
                                        out.println("<div class='col-md-20 mt-2'><label class='labels'>Phone Number</label><input type='text' name='phoneNum' class='form-control' placeholder='Enter Phone Number' value='"
                                                + user.getPhoneNo()
                                                + "'></div>");
                                        out.println("<div class='col-md-20 mt-2'><label class='labels'>Email</label><input type='text' name='email' class='form-control' placeholder='Enter Email' value='"
                                                + user.getEmail()
                                                + "' disabled></div>");
                                        out.println("<div class='col-md-20 mt-2'><label class='labels'>Address</label><input type='text' name='Address' class='form-control' placeholder='Enter Address' value='"
                                                + user.getAddress()
                                                + "'></div>");
                                        out.println("<div class='col-md-20 mt-2'><label class='labels'>Postcode</label><input type='text' name='Postcode' class='form-control' placeholder='Enter Postcode' value='"
                                                + user.getPostcode()
                                                + "'></div>");
                                        out.println("<div class='col-md-20 mt-2'><label class='labels'>City</label><input type='text' name='City' class='form-control' placeholder='Enter City' value='"
                                                + user.getCity()
                                                + "'></div>");
                                        out.println("<div class='col-md-20 mt-2'><label class='labels'>Region</label><select class='form-select mb-2' aria-label='Region' name='Region'><option selected disabled>"
                                                + user.getRegion()
                                                + "</option><option value='Northern'>Northern Region (Perlis, Kedah, Penang, Perak)</option><option value='East Coast'>East Coast Region (Kelantan, Terengganu, Pahang)</option><option value='Central'>Central Region (Selangor, Kuala Lumpur, Putrajaya)</option><option value='Southern'>Southern Region (Negeri Sembilan, Melaka, Johor)</option></select></div>");
                                    out.println("</div>");
                                out.println("</div>");
                            out.println("</div>");
                        out.println("<div class='pb-2 text-center'><button class='btn btn-primary profile-button' type='submit'>Update Profile</button></div>");
                        out.println("</form>");
                        out.println("<div class='pb-5 text-center'><a class='btn btn-primary profile-button' type='button' href='LogoutServlet'>Log Out</a></div>");
                    out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
            }
        
           
        %>
    </body>
</html>
