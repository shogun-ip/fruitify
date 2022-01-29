/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import model.Order;

/**
 *
 * @author YOMATASHI
 */
public class saveOrderServlet extends HttpServlet {

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
        
        HttpSession session = request.getSession(true);
        ArrayList<Order> order = (ArrayList<Order>)session.getAttribute("order");
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "fruitify";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pword = "";
        String query = "INSERT INTO orders(product_id, quantity, customer_name) VALUES(?,?,?)";

        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, userName, pword);
        PreparedStatement st = con.prepareStatement(query);
        
        for(int i = 0; i < order.size(); i++){
            st.setInt(1, order.get(i).getProduct_id());
            st.setInt(2, order.get(i).getQuantity());
            st.setString(3, order.get(i).getCustomer_name());
            st.executeUpdate();
        }
        
        int currstock = 0;
        int newstock = 0;
        String qrry = "SELECT stock FROM fruits WHERE id=?";
        String qry = "UPDATE fruits SET stock=? WHERE id=?";
        ResultSet rs;
        for(int i = 0; i < order.size(); i++){
            st = con.prepareStatement(qrry);
            st.setInt(1, order.get(i).getProduct_id());
            rs = st.executeQuery();
            while(rs.next()){
                currstock = rs.getInt("stock");
            }
            
            newstock = currstock - order.get(i).getQuantity();
            st = con.prepareStatement(qry);
            st.setInt(1, newstock);
            st.setInt(2, order.get(i).getProduct_id());
            st.executeUpdate();
        }
        
        session.removeAttribute("order");
        session.removeAttribute("cart-list");
        st.close();
        con.close();
        
        RequestDispatcher rd = request.getRequestDispatcher("/checkout.jsp");
        rd.forward(request, response);
        
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
            Logger.getLogger(saveOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(saveOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(saveOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(saveOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
