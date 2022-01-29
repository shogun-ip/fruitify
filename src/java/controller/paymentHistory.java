/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import model.Account;
import model.OrderHistory;

/**
 *
 * @author YOMATASHI
 */
public class paymentHistory extends HttpServlet {

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
        Account user = (Account)session.getAttribute("account");
        ArrayList<OrderHistory> orderHist = new ArrayList<OrderHistory>();
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "fruitify";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pword = "";
        
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, userName, pword);
        
        String query = "SELECT * FROM orders WHERE customer_name=? ORDER BY id DESC";
        PreparedStatement st = con.prepareStatement(query); 
        st.setString(1, user.getName());
        ResultSet rs = st.executeQuery();
        String qry = "SELECT * FROM fruits";
        st = con.prepareStatement(qry);
        ResultSet rs2 = st.executeQuery();
        
        OrderHistory temp_order = new OrderHistory();
        while(rs.next()){
            while(rs2.next()){
                if(rs.getInt("product_id") == rs2.getInt("id")){
                    temp_order.setProd_name(rs2.getString("name"));
                    temp_order.setPrice((rs.getInt("quantity"))*(rs2.getDouble("price")));
                }
            }
            temp_order.setOrder_id(rs.getInt("id"));
            temp_order.setQty(rs.getInt("quantity"));
            rs2 = st.executeQuery();
            orderHist.add(temp_order);
            temp_order = new OrderHistory();
        }
        
        st.close();
        con.close();
        request.setAttribute("orderHist", orderHist);
        RequestDispatcher rd = request.getRequestDispatcher("/paymentHistory.jsp");
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
            Logger.getLogger(paymentHistory.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(paymentHistory.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(paymentHistory.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(paymentHistory.class.getName()).log(Level.SEVERE, null, ex);
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
