<%-- 
    Document   : cart
    Created on : Jan 7, 2022, 9:49:27 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
        <title>Cart page</title>
        
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
                    <a class="nav-link" href="#">Promotion</a>
                    <a class="nav-link" href="#">About Us</a>
                    <a class="nav-link" href="LoginServlet">Account</a>
                </div>
              </div>
            </div>
        </nav>
        
        <div class ="container">
            <div class="d-flex py-3">
                <h3>Total Price: RM180.00</h3>
                <a class="mx-3 btn btn-primary" href="#">Check Out</a>
            </div>
            <table class="table table-loght">
                <thead>
                    <tr>
                        <th scope="col">Fruit</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th> 
                        <th scope="col">Cancel</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Watermelon</td>
                         <td>
                <form action="" method="post" class="form-inline">
                    <input type="hidden" name="id" value="1" class="form-input">
                    <div class="form-group d-flex justify-content-between">
                         <a class="btn btn-sm btn-decre" href=""><i class="fas fa-minus-square"></i></a>
                        <input type="text" name="quantity" class="form-control" value="1" readonly>
                        <a class="btn btn-sm btn-incre" href=""><i class="fas fa-plus-square"></i></a>
                    </div>  
                </form>
                        </td>
                        <td>RM60.00</td>
                        <td><a class="btn btn-sm btn-danger" href="">Remove</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
        
<!--        <div class="cart">
            <div class="title">
                My Cart
            </div>
            
            Product#1
            <div class="fruit">
                
            </div>
            
            <div class="image">
                <img src="img/banana.png">
            </div>
            
            <div class="description">
                <span>Banana</span>
            </div>
            
            <div class="quantity">
                
            </div>
            
            <div class="total-price">RM60.00</div>
        </div>-->
        
    </body>
</html>
