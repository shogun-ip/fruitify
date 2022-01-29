/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;

/**
 *
 * @author user
 */
@WebServlet("/quantity-inc-dec")
public class QuantityIncDecServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String action = request.getParameter("action");
            int id = Integer.parseInt(request.getParameter("id"));
            HttpSession session= request.getSession(true);
            ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");
            
            if(action != null && id>=1) {
                if(action.equals("inc")){
                    for(Cart c:cart_list) {
                        int quantity = c.getQuantity();
                        quantity++;
                        c.setQuantity(quantity);
                        response.sendRedirect("/cart.jsp");
                    }
                }
            }
            else if (action.equals("dec")){
                for (Cart c: cart_list){
                    if(c.getId() == id && c.getQuantity() > 1){
                        int quantity = c.getQuantity();
			quantity--;
			c.setQuantity(quantity);
			break;
                    }
                }
                response.sendRedirect("/cart.jsp");
            }
            else{
                response.sendRedirect("/cart.jsp");
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

