/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrdersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Order;
import model.User;

/**
 *
 * @author Admin
 */
public class OrderNowServlet extends HttpServlet {

    OrdersDAO ordersDAO = new OrdersDAO();

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderNowServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderNowServlet at " + request.getContextPath() + "</h1>");
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
        User auth = (User) request.getSession().getAttribute("auth");
        
        if (auth != null) {
            try ( PrintWriter out = response.getWriter()) {
                String productId = request.getParameter("id");
                int productQuantity = Integer.parseInt(request.getParameter("quantity"));
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Date date = new Date();
                
                if (productQuantity <= 0) {
                    productQuantity = 1;
                }
                
                Order orderModel = new Order();
                orderModel.setId(Integer.parseInt(productId));
                orderModel.setUid(auth.getId());
                orderModel.setQuantity(productQuantity);
                orderModel.setDate(formatter.format(date));
                
                boolean result = ordersDAO.insertOrder(orderModel);
                if (result) {
                    response.sendRedirect(request.getContextPath() + "/orders");
                } else {
                    out.print("Order failed!!");
                }
            }
            
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
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
        HttpSession session = request.getSession();
         
        User auth = (User) request.getSession().getAttribute("auth");
        String productId = request.getParameter("id");
        int productQuantity = Integer.parseInt(request.getParameter("quantity"));
        
        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("carts");
        
        try ( PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            if (productQuantity <= 0) {
                productQuantity = 1;
            }

            Order orderModel = new Order();
            orderModel.setId(Integer.parseInt(productId));
            orderModel.setUid(auth.getId());
            orderModel.setQuantity(productQuantity);
            orderModel.setDate(formatter.format(date));
            boolean result = ordersDAO.insertOrder(orderModel);
            
            if (result) {
                if(cart_list != null){
                    for(Cart c: cart_list){
                        if(c.getId()== Integer.parseInt(productId)){
                            cart_list.remove(cart_list.indexOf(c));
                            break;
                        }
                    }
                }
                request.setAttribute("carts", cart_list);
                response.sendRedirect(request.getContextPath()+"/orders");
            } else {
                response.sendRedirect(request.getContextPath() + "/login");
            }
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
