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
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
/**
 *
 * @author YOMATASHI
 */
public class editStockServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            HttpSession session = request.getSession(true);
            Account user = (Account)session.getAttribute("account");
            Vector<String> fruitName = new Vector<String>();
            
            String driver = "com.mysql.jdbc.Driver";
            String dbName = "fruitify";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userName = "root";
            String pword = "";
            String query = "UPDATE fruits WHERE id=?";

            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, userName, pword);
            PreparedStatement st = con.prepareStatement(query); 
            int supplier_id = Integer.parseInt(request.getParameter("sup_id"));
            ResultSet rs = st.executeQuery(); 
            
            int sup_id = 0;
            while(rs.next()){
                sup_id = rs.getInt("id");
            }
            
            Fruits temp = new Fruits();
            while(rs.next()){
            temp.setName(rs.getString(1));
            temp.setPrice(rs.getFloat(2));
            temp.setStock(rs.getInt(3));
            fruits.addElement(temp);
            temp = new Fruits();
        }
            }
            st.close();
            con.close();
            
            request.setAttribute("fruitName", fruitName);
            RequestDispatcher rd = request.getRequestDispatcher("/manageProduct.jsp");
            rd.forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
