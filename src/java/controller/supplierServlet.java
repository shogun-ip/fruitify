/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Supplier;
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author YOMATASHI
 */
public class supplierServlet extends HttpServlet {

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
        Vector<Supplier> supplier = new Vector<Supplier>();
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "fruitify";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pword = "";
        String query = "SELECT * FROM suppliers";
        
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, userName, pword);
        Statement st = con.createStatement(); 
        ResultSet rs = st.executeQuery(query); 
        
        Supplier temp = new Supplier();
        while(rs.next()){
            temp.setId(rs.getInt(1));
            temp.setName(rs.getString(2));
            temp.setRegion(rs.getString(3));
            temp.setLink(rs.getString(4));
            supplier.addElement(temp);
            temp = new Supplier();
        }
        if(user == null){
            request.setAttribute("supplier", supplier);
            RequestDispatcher rd = request.getRequestDispatcher("/selectSupplier.jsp");
            rd.forward(request, response);
        }else{
            if(user.getRole().equals("supplier")){
                RequestDispatcher rd = request.getRequestDispatcher("editStockServlet");
                rd.forward(request, response);
            }else{
                request.setAttribute("supplier", supplier);
                RequestDispatcher rd = request.getRequestDispatcher("/selectSupplier.jsp");
                rd.forward(request, response);
            }
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
            Logger.getLogger(supplierServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(supplierServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(supplierServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(supplierServlet.class.getName()).log(Level.SEVERE, null, ex);
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
