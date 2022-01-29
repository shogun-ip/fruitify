<%-- 
    Document   : paymentHistory
    Created on : Jan 29, 2022, 4:38:16 PM
    Author     : user
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.OrderHistory"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
        <title>Payment History</title>
        
        <style>
            body{
                background-color: #B6C197;
                width: 100%;
                height: 100%;
                margin: 0;
                font-family: 'Roboto', sans-serif;
            }
            
            .cart{
                width: 750px;
                height: 423px;
                margin: 80px auto;
                background: #FFFFFF;
                box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.10);
                border-radius: 6px;
                display: flex;
                flex-direction: column;
            }
            
            .title{
                height: 60px;
                border-bottom: 1px solid #E1E8EE;
                padding: 20px 30px;
                color: #5E6977;
                font-size: 18px;
                font-weight: 400;
            }
            
            .fruit{
                padding: 20px 30px;
                height: 120px;
                display: flex;
            }
            
            .fruit:nth-child(3) {
                border-top:  1px solid #E1E8EE;
                border-bottom:  1px solid #E1E8EE;
            }
            
            .image{
                margin-right: 50px;
            }
            
            .description{
                padding-top: 10px;
                margin-right: 60px;
                width: 115px;
            }
            
            .description span{
                 display: block;
                 font-size: 14px;
                 color: #43484D;
                 font-weight: 400;
            }
            
            .description span:first-child {
            margin-bottom: 5px;
            }
            
            .description span:last-child {
            font-weight: 300;
            margin-top: 8px;
            color: #86939E;
            }
            
            .quantity {
            padding-top: 20px;
            margin-right: 60px;
            }
            
            .quantity input {
            -webkit-appearance: none;
             border: none;
            text-align: center;
            width: 32px;
            font-size: 16px;
            color: #43484D;
            font-weight: 300;
            }
            
            .total-price{
                width: 83px;
                padding-top: 27px;
                text-align: center;
                font-size: 16px;
                color: #43484D;
                font-weight: 300;
            }
            
            
            .table tbody td{
                vertical-align: middle;
            }
            .btn-incre, .btn-decre {
                box-shadow: none;
                font-size: 25px;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
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
                    <a class="nav-link active" aria-current="page" href="paymentHistory">My order</a>
                    <a class="nav-link" href="LoginServlet">Account</a>
                </div>
              </div>
            </div>
        </nav>
        
        <div class="container pt-3">
            <div class="row px-4 pt-2 bg-light">
                <p class="fs-4">Order History</p>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Order ID</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price (RM)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            ArrayList<OrderHistory> orderHist = (ArrayList<OrderHistory>)request.getAttribute("orderHist");
                            DecimalFormat format = new DecimalFormat("#0.00");
                            for(int i = 0; i < orderHist.size(); i++){
                        %>
                        <tr>
                            <td scrop="row"><% out.print(orderHist.get(i).getOrder_id()); %></td>
                            <td scrop="row"><% out.print(orderHist.get(i).getProd_name()); %></td>
                            <td scrop="row"><% out.print(orderHist.get(i).getQty()); %></td>
                            <td scrop="row"><% out.print(format.format(orderHist.get(i).getPrice())); %></td>
                        </tr>
                        <% 
                            } 
                        %>
                    </tbody>
                </table>
            </div>
       
    </body>
</html>
