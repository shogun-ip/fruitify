<%-- 
    Document   : salesOverview
    Created on : Jan 24, 2022, 8:09:29 AM
    Author     : YOMATASHI
--%>

<%@page import="java.util.Vector"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
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
                    <a class="nav-link" href="ManageProductServlet">Supplier</a>
                    <a class="nav-link" href="#">Promotion</a>
                    <a class="nav-link" href="#">About Us</a>
                    <a class="nav-link active" aria-current="page" href="salesOverviewServlet">Sales Overview</a>
                    <a class="nav-link" href="LoginServlet">Account</a>
                </div>
              </div>
            </div>
        </nav>
        <%
           Vector<String> fruitName = (Vector)request.getAttribute("fruitName");
//           for(int i = 0; i< fruitName.size(); i++){
//               out.println(fruitName.get(i) + "<br>");
//           }
        %>
        <!-- Sales Overview -->
        <div class="container pt-3">
            <div class="row px-4 pt-2 bg-light">
                <p class="fs-4">Reports (Today)</p>
                <div><canvas id="salechart"></canvas></div>
            </div>
            <div class="row bg-light px-4 pt-5">
                <p class="fs-4">Recent Sales (Today)</p>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Customer</th>
                            <th scope="col">Product</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price (RM)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td scrop="row">customer name here</td>
                            <td scrop="row">product name here</td>
                            <td scrop="row">quantity here</td>
                            <td scrop="row">price here</td>
                        </tr>
                        <tr>
                            <td scrop="row">customer name here</td>
                            <td scrop="row">product name here</td>
                            <td scrop="row">quantity here</td>
                            <td scrop="row">price here</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
        <script>
            var xValues = [
            <%
                for(int i = 0; i< fruitName.size(); i++){
                    out.println("'" + fruitName.get(i)+ "' ,");
                }
            %>
            ];
            var yValues = [5,2,8,0,9];

            new Chart("salechart", {
              type: "line",
              data: {
                labels: xValues,
                datasets: [{
                  label: "sales (RM)",
                  fill: false,
                  lineTension: 0,
                  backgroundColor: "rgba(0,0,0,1.0)",
                  borderColor: "#B6C197",
                  data: yValues
                }]
              },
              options: {
                legend: {
                    display: true,
                },
                scales: {
                  yAxes: [{ticks: {min: 0, max:10}}],
                }
              }
            });
        </script>
    </body>
</html>
