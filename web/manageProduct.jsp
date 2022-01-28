<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Fruits"%>
<%@page import="java.util.Vector"%>
<%@page import="model.Account"%>
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
                    <a class="nav-link active" aria-current="page" href="supplierServlet">Supplier</a>
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
        
        <div class="container">
            <div class="row">
                <table class="content-table">
                    <thead>
                        <tr class="text-center">
                        <th>No</th>
                        <th>Photo</th>
                        <th>Fruit Name</th>
                        <th>Price</th>
                        <th>Availability</th>
                        <th colspan="2">Action</th>
                      </tr>
                    </thead>
                    <tbody class="text-center">
        <%
            //Account user = (Account)session.getAttribute("account");
            Vector<Fruits> fruits = (Vector)request.getAttribute("fruits");
            
            int no = 1;
            DecimalFormat format = new DecimalFormat("#0.00");
            for(int i = 0; i < fruits.size(); i++){
                out.print("<tr>"
                            + "<form method='POST' action='editStockServlet'>"
                            + "<th>" + no + "</th>"
                            + "<input type='text' name='fruit_id' value='"+ fruits.get(i).getId() +"'  hidden>"
                            + "<td><img src='img/"+ fruits.get(i).getPict() + "' alt='"+ fruits.get(i).getName() + "' width='100' height='80'></td>"
                            + "<th><input name='fruitname' type='text' value='" + fruits.get(i).getName() + "'></th>"
                            + "<th>RM <input name='fruitprice' type='text' value='");
                out.print(format.format(fruits.get(i).getPrice())); 
                out.println("'></th>"
                            + "<th><input name='fruitstock' type='number' min='0' step='10' value='"+ fruits.get(i).getStock() + "'></th>"
                            + "</form>"
                            + "<td><input type='submit' value='Edit'></td>"
                            + "<form method='POST' action='deleteStockSerlvet'>"
                            + "<input type='text' name='fruit_id' value='"+ fruits.get(i).getId() +"'  hidden>"
                            + "<td><input type='submit' value='Delete'></td>"
                            + "</form>");
                no++;
            }
        %>
                    </tbody>
                </table>
            </div>
        </div>
       
   	     	       
    </body>
</html>
<!DOCTYPE html><html><head><link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet" /><link href="./css/main.css" rel="stylesheet" /><title>Document</title></head>
