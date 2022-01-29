<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
body {
  font-family: Arial;
  font-size: 17px;
  background-color: #B6C197;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.containerr {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #2238E0;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #2236D0;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
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
                <a class="nav-link" href="LoginServlet">Account</a>
            </div>
          </div>
        </div>
    </nav>
    
    <div class="container mt-3">
        <h2><b>Payment Details</b></h2>
        <p>Complete your purchase by providing your payment details</p>
        <div class="row">
          <div class="col-75">
            <div class="containerr">
              <form action="index.jsp" method="post">

                <div class="row">
                  <div class="col-50">
                    <h3>Billing Address</h3>
                    <label for="fname"><i class="fa fa-user"></i> Name</label>
                    <input type="text" id="fname" name="firstname" placeholder="John Doe">
                    <label for="email"><i class="fa fa-envelope"></i> Email</label>
                    <input type="text" id="email" name="email" placeholder="email@example.com">
                    <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                    <input type="text" id="adr" name="address" placeholder="Taman Setia 3, Jalan Setia">
                    <label for="city"><i class="fa fa-institution"></i> City</label>
                    <input type="text" id="city" name="city" placeholder="Bangi">

                    <div class="row">
                      <div class="col-50">
                        <label for="state">State</label>
                        <input type="text" id="state" name="state" placeholder="Selangor">
                      </div>
                      <div class="col-50">
                        <label for="zip">Zip</label>
                        <input type="text" id="zip" name="zip" placeholder="54000">
                      </div>
                    </div>
                  </div>

                  <div class="col-50">
                    <h3>Payment Information</h3>
                    <label for="fname">Accepted Cards</label>
                    <div class="icon-container">
                      <i class="fa fa-cc-visa" style="color:navy;"></i>
                      <i class="fa fa-cc-mastercard" style="color:red;"></i>
                       <i class="fa fa-cc-paypal" style="color:blue;"></i>
                    </div>
                    <label for="ccnum">Card number</label>
                    <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
                    <label for="expmonth">Exp Month</label>
                    <input type="text" id="expmonth" name="expmonth" placeholder="September">
                    <div class="row">
                      <div class="col-50">
                        <label for="expyear">Exp Year</label>
                        <input type="text" id="expyear" name="expyear" placeholder="2018">
                      </div>
                      <div class="col-50">
                        <label for="cvv">CVV</label>
                        <input type="text" id="cvv" name="cvv" placeholder="Three digits">
                      </div>
                    </div>
                  </div>
                  
                </div>
                  <button onclick="myFunction()" class="w-100 btn btn-lg btn-primary" type="submit">Place Order</button>
              </form>
            </div>
          </div>
        </div>
    </div>
<script>
function myFunction() {
  alert("Order has been placed.");
}
</script>
</body>
</html>

