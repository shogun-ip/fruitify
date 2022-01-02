
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
    </head>
    <body>
        <form onsubmit="">
        <h1 align="left">Payment Detail</h1>
        <p>Complete your purchase by providing your payment details</p>
        <br>
        <h3 align="left">Contact Detail</h3>
        <div class="form-group">
            <label>First Name: </label>
            <input type="text" name="fname">
        </div>
        <br>
        <div class="form-group">
            <label>Last Name: </label>
            <input type="text" name="lname">
        </div>
        <br>
         <div class="form-group">
            <label>State: </label>
            <select name="state">
                <option value="">----Please select a state----</option>
                <option value="Selangor">Selangor</option>
                <option value="Wilayah Persekutuan">Kuala Lumpur</option>
                <option value="Johor">Johor</option>
                <option value="Kedah">Kedah</option>
            </select>
        </div>
        <br>
        <div class="form-group">
            <label>Address: </label>
            <textarea name="address" rows="5"></textarea>
        </div>
        <br>
        <h3 align="left">Contact Detail</h3>
        <div class="form-inline">
            <div class="form-group">
            <label>Contact No:</label>
            <input type="text" name="contact">
        </div>
        <br>
            <div class="form-group">
            <label>Email:</label>
            <input type="text" name="email">
        </div>
        <br>
        <h3 align="left">Additional Information (Optional)</h3>
        <div class="form-group">
            <label>Order Note:</label>
            <textarea name="address" rows="3"></textarea>
        </div>
        <br>
        <h3 align="left">Payment Information</h3>
        <input type="radio"
               name="creditcard"
               value="creditcard">Credit Card
        <input type="radio"
               name="paypal"
               value="paypal">PayPal
        <br><br>
        <input type="submit" value="Place Order">
        </form>
    </body>
</html>
