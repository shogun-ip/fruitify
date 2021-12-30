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
import model.Account;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

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

//        Account account = new Account();
        String name, address, city, region, email, password;
        int phoneNo, postcode;
        name = request.getParameter("FullName");
        phoneNo = Integer.parseInt(request.getParameter("phoneNum"));
        address = request.getParameter("Address");
        postcode = Integer.parseInt(request.getParameter("Postcode"));
        city = request.getParameter("City");
        region = request.getParameter("Region");
        email = request.getParameter("email");
        password = request.getParameter("Password");

        String driver = "com.mysql.jdbc.Driver";
        String dbName = "fruitify";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String pword = "";
        String query = "INSERT INTO useraccounts(fullname, phoneNo, address, postcode, city, region, email, password) VALUES(?,?,?,?,?,?,?,?)";

        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, userName, pword);
        PreparedStatement st = con.prepareStatement(query);

        st.setString(1, name);
        st.setInt(2, phoneNo);
        st.setString(3, address);
        st.setInt(4, postcode);
        st.setString(5, city);
        st.setString(6, region);
        st.setString(7, email);
        st.setString(8, password);

        int insertStatus = 0;

        st.executeUpdate();
        System.out.println(insertStatus + "row affected");

        st.close();
        con.close();

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InsertServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Success</h1>");
            out.println("</body>");
            out.println("</html>");
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
