/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;

/**
 *
 * @author YOMATASHI
 */
public class AddToCartServlet extends HttpServlet {

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
            ArrayList<Cart> cartList = new ArrayList<Cart>();
            int qty = Integer.parseInt(request.getParameter("quantity"));
            int id = Integer.parseInt(request.getParameter("id"));
            
            String driver = "com.mysql.jdbc.Driver";
            String dbName = "fruitify";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userName = "root";
            String pword = "";
            String query = "SELECT * FROM fruits WHERE id=?";
            
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, userName, pword);
            PreparedStatement st = con.prepareStatement(query); 
            st.setInt(1,id);
            ResultSet rs = st.executeQuery(); 
            
            String name = "";
            double price = 0.0;
            while(rs.next()){
                name = rs.getString("name");
                price = rs.getDouble("price");
            }
            
            Cart cm = new Cart();
            cm.setId(id);   
            cm.setQuantity(qty);
            cm.setFruitname(name);
            cm.setPrice(price);
            cm.setTotal(price*qty);
            
            ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");
            
            if(cart_list == null) {
                cartList.add(cm);
                session.setAttribute("cart-list",cartList);
//                out.println("session created and added the list");
            }else {
                 cartList = cart_list;
                 boolean exist = false;
                 
                 for(Cart c:cart_list) {
                     if(c.getId() == id) {
                         exist = true;
//                         out.println("product exist");
                     }  
                 }
                  if(!exist) {
                         cartList.add(cm);
//                         out.println("product added");
                    }
            }
            RequestDispatcher rd = request.getRequestDispatcher("/cart.jsp");
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
            Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
