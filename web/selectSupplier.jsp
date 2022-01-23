<%-- 
    Document   : selectSupplier
    Created on : Dec 30, 2021, 6:45:01 PM
    Author     : YOMATASHI
--%>

<%@page import="java.util.Vector"%>
<%@page import="model.Supplier"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Suppliers</title>
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
            
            img{
                opacity: 70%;
            }
            
            img.greyed{
                opacity: 35%;
            }
            
            a.disabled{
                pointer-events: none;
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
                    <%
                        Account user = (Account)session.getAttribute("account");
                        if(user.getRole().equals("supplier")){
                            out.println("<a class='nav-link active' aria-current='page' href='supplierServlet'>Supplier</a>");
                        }else{
                            out.println("<a class='nav-link active' aria-current='page' href='supplierServlet'>Supplier</a>");
                        }
                    %>
                    <a class="nav-link" href="#">Promotion</a>
                    <a class="nav-link" href="#">About Us</a>
                    <a class="nav-link" href="LoginServlet">Account</a>
                </div>
              </div>
            </div>
        </nav>
        
        <!-- Select supplier -->
        <div class="container">
            <div class="row py-3">
                <h2>Suppliers</h2>
                <p class="fs-5">*Greyed out supplier is not available for your location</p>
            </div>
        <%
            //Account user = (Account)session.getAttribute("account");
            Vector<Supplier> supplier = (Vector)request.getAttribute("supplier");
            Vector<Supplier> activSup = new Vector<Supplier>();
            Vector<Supplier> passivSup = new Vector<Supplier>();
            
            if(user == null){
                out.println("<p>Please <a href='login.jsp'>log in</a> first.</p>");
            }else{
                
            //separate available supplier according to user's region
            for(int i = 0; i < supplier.size(); i++){
                if(user.getRegion().equals(supplier.get(i).getRegion())){
                   activSup.addElement(supplier.get(i));
                }else{
                    passivSup.addElement(supplier.get(i));
                }
            }
            
            //print available supplier
            for(int i = 0; i < activSup.size(); i++){
                out.println("<div class='card bg-dark mb-4'>" +
                                "<img src='img/fruit-card-bg.jpg' class='card-img' alt='fruitify-card-bg'>" +
                                "<div class='card-img-overlay text-center'>" +
                                    "<br><br>" +
                                    "<form action='orderServlet' method='POST'>" +
                                        "<input type='text' name='sup_id' value='"+ activSup.get(i).getId() +"' hidden>" +
                                        "<button class='btn btn-lg btn-link fs-1 text-white text-decoration-none' type='submit'>" + activSup.get(i).getName() +
                                    "</form>" +
                                    //"<a class='card-text fs-1 text-white text-decoration-none' href='orderServlet'>" + activSup.get(i).getName() + "</a>" +
                                "</div>" +
                             "</div>");
            }
            
            //print greyed out supplier
            for(int i = 0; i < passivSup.size(); i++){
                out.println("<div class='card bg-dark mb-4'>" +
                                "<img src='img/fruit-card-bg.jpg' class='card-img greyed' alt='fruitify-card-bg'>" +
                                "<div class='card-img-overlay text-center'>" +
                                    "<br><br>" +
                                    "<a class='card-text fs-1 text-white-50 disabled text-decoration-none' href='#'>" + passivSup.get(i).getName() + "</a>" +
                                "</div>" +
                            "</div>");
            }
            
            }
        %>
        </div>
    </body>
</html>
