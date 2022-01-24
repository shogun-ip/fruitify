/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author faris
 */
public class UpdateServlet extends HttpServlet {

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

        String name, phoneNo, address, city, region, email;
        int postcode;
        
        name = request.getParameter("FullName");
        phoneNo = request.getParameter("phoneNum");
        address = request.getParameter("Address");
        postcode = Integer.parseInt(request.getParameter("Postcode"));
        city = request.getParameter("City");
        region = request.getParameter("Region");
        email = request.getParameter("email");

        String driver = "com.mysql.jdbc.Driver";
        String dbName = "fruitify";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pword = "";
        String query = "UPDATE useraccounts SET fullname=?,phoneNo=?,address=?,postcode=?,city=?,region=? WHERE email = '" + user.getEmail() + "'";

        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, userName, pword);
        PreparedStatement st = con.prepareStatement(query);

        st.setString(1, name);
        st.setString(2, phoneNo);
        st.setString(3, address);
        st.setInt(4, postcode);
        st.setString(5, city);
        st.setString(6, region);
        
        st.executeUpdate();
        
        st.close();
        con.close();

        user.setName(name);
        user.setPhoneNo(phoneNo);
        user.setAddress(address);
        user.setPostcode(postcode);
        user.setCity(city);
        user.setRegion(region);

        session.setAttribute("account", user);

        try (PrintWriter out = response.getWriter()) {
            RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
            rd.include(request, response);
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
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
