/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author YOMATASHI
 */
public class LoginServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException, ClassNotFoundException{
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(true);
        Account user = (Account)session.getAttribute("account");
        
        if(user == null){
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            String driver = "com.mysql.jdbc.Driver";
            String dbName = "fruitify";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userName = "root";
            String pword = "";
            String query = "SELECT * FROM useraccounts";

            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, userName, pword);
            Statement st = con.createStatement(); 
            ResultSet rs = st.executeQuery(query); 

            boolean checkpw = false;
            while(rs.next()){
                if(rs.getString(7).equals(email) && rs.getString(8).equals(password)){
                    checkpw = true;
                    break;
                }
                else{
                    checkpw = false;
                }
            }
            if(checkpw){
                Account account = new Account();
                account.setName(rs.getString(1));
                account.setPhoneNo(rs.getString(2));
                account.setAddress(rs.getString(3));
                account.setPostcode(rs.getInt(4));
                account.setCity(rs.getString(5));
                account.setRegion(rs.getString(6));
                account.setEmail(email);
                account.setPassword(password);
                account.setRole(rs.getString(9));
                session.setAttribute("account", account);
                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            }else{
                try (PrintWriter out = response.getWriter()) {
                    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                    rd.include(request, response);
                    out.println("<p class='text-center error-msg'>Note: Make sure your email and password is correct</p>");
                }
            }
        }else{
            RequestDispatcher rd = request.getRequestDispatcher("/profile.jsp");
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
        try{
            processRequest(request, response);
        }catch(SQLException ex){
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        try{
            processRequest(request, response);
        }catch(SQLException ex){
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
