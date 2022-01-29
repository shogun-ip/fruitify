package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author YOMATASHI
 */
public class CheckoutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        String fullname,email,address,city,state,card_number,exp_month;
            int zip,exp_year,cvv;
            
            fullname = request.getParameter("fullname");
            email = request.getParameter("email");
            address = request.getParameter("address");
            city = request.getParameter("city");
            state = request.getParameter("state");
            zip = Integer.parseInt(request.getParameter("zip"));
            card_number = request.getParameter("cardnumber");
            exp_month = request.getParameter("expmonth");
            exp_year = Integer.parseInt(request.getParameter("expyear"));
            cvv = Integer.parseInt(request.getParameter("cvv"));
            
            String driver = "com.mysql.jdbc.Driver";
            String dbName = "fruitify";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userName = "root";
            String pword = "";
            String query = "INSERT INTO payment(fullname, email, address,city, state, zip, card_number, exp_month, exp_year, cvv) VALUES(?,?,?,?,?,?,?,?,?,?)";
        
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, userName, pword);
        PreparedStatement st = con.prepareStatement(query);
        
        st.setString(1, fullname);
        st.setString(2, email);
        st.setString(3, address);
        st.setString(4, city);
        st.setString(5, state);
        st.setInt(6, zip);
        st.setString(7, card_number);
        st.setString(8, exp_month);
        st.setInt(9, exp_year);
        st.setInt(10, cvv);
        
        st.executeUpdate();
        
        st.close();
        con.close();
        
        
        try (PrintWriter out = response.getWriter()) {
            RequestDispatcher rd = request.getRequestDispatcher("payment.jsp");
            rd.include(request, response);
            out.println("<p class='text-center'>Payment completed! Go to <a class='text-decoration-none' href='payment.jsp'>Payment page</a>.</p>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

