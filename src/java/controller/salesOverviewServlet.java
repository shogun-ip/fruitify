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
import model.Reports;
import model.Sales;

/**
 *
 * @author YOMATASHI
 */
public class salesOverviewServlet extends HttpServlet {

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
            Vector<Reports> reports = new Vector<Reports>();
            Vector<Sales> sales = new Vector<Sales>();
            int max = 1;
            
            String driver = "com.mysql.jdbc.Driver";
            String dbName = "fruitify";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userName = "root";
            String pword = "";
            String query = "SELECT id FROM suppliers WHERE name=?";

            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, userName, pword);
            PreparedStatement st = con.prepareStatement(query); 
            st.setString(1, user.getName());
            ResultSet rs = st.executeQuery(); 
            
            //SUPPLIER ID
            int sup_id = 0;
            while(rs.next()){
                sup_id = rs.getInt("id");
            }
            
            String query2 = "SELECT name, id FROM fruits WHERE supplier_id=?";
            st = con.prepareStatement(query2);
            st.setInt(1, sup_id);
            rs = st.executeQuery();
            
            //REPORT FruitName & QtySold 
            Reports temp_report = new Reports();
            int qty_sales = 0;
            while(rs.next()){
                temp_report.setFruit_name(rs.getString("name"));
                temp_report.setFruit_id(rs.getInt("id"));
                temp_report.setQty_sold(qty_sales);
                reports.add(temp_report);
                temp_report = new Reports();
            }

            //SALES CustomerName, ProductName, eachprice
            String qry = "SELECT * FROM orders ORDER BY id DESC";
            st = con.prepareStatement(qry);
            rs = st.executeQuery();
            String qry2 = "SELECT * FROM fruits";
            st = con.prepareStatement(qry2);
            ResultSet rs2 = st.executeQuery();
            Sales temp_sales = new Sales();
            
            while(rs.next()){
                while(rs2.next()){
                    if(rs.getInt("product_id") == rs2.getInt("id")){
                        temp_sales.setSup_id(rs.getInt("supplier_id")); 
                        temp_sales.setProduct_name(rs2.getString("name"));
                        temp_sales.setEachprice((rs.getInt("quantity"))*(rs2.getDouble("price")));
                        for(int i = 0; i < reports.size(); i++){
                            if(reports.get(i).getFruit_id() == (rs2.getInt("id"))){
                                qty_sales = reports.get(i).getQty_sold() + rs.getInt("quantity");
                                reports.get(i).setQty_sold(qty_sales);
                                if(max < qty_sales){
                                    max = qty_sales;
                                }
                            }
                        }
                    }
                }
                rs2 = st.executeQuery();
                temp_sales.setQty(rs.getInt("quantity"));
                temp_sales.setCustomer_name(rs.getString("customer_name"));
                sales.add(temp_sales);
                temp_sales = new Sales();
            }
            
            st.close();
            con.close();
            
            request.setAttribute("sup_id", sup_id);
            request.setAttribute("max", max);
            request.setAttribute("sales", sales);
            request.setAttribute("reports", reports);
            RequestDispatcher rd = request.getRequestDispatcher("/salesOverview.jsp");
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
            Logger.getLogger(salesOverviewServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(salesOverviewServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(salesOverviewServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(salesOverviewServlet.class.getName()).log(Level.SEVERE, null, ex);
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
