/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;

/**
 *
 * @author hoang
 */
public class CartController extends HttpServlet {

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
        HttpSession session = request.getSession();
        List<Cart> list = null;
        double totalPrice = 0;
        if(session.getAttribute("listCart")!=null){
            list = (List<Cart>) session.getAttribute("listCart");
            for (Cart cart : list) {
                totalPrice = totalPrice + (cart.getProductPrice()*cart.getQuantity());
            }
            if(request.getParameter("action")!=null && request.getParameter("action").equals("remove")){
                int id = Integer.parseInt(request.getParameter("id"));
                for (Cart cart : list) {
                    if(cart.getProductId()==id){
                        totalPrice= totalPrice - (cart.getProductPrice()*cart.getQuantity());
                        list.remove(cart);
                        break;
                    }
                }
            }
        }
        
        request.setAttribute("cart", list);
        request.setAttribute("total", totalPrice);
        request.getRequestDispatcher("./client/cart.jsp").forward(request, response);
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
            List<Cart> cart = (List<Cart>) request.getSession().getAttribute("listCart");
            HashMap<Integer,Integer> list = new HashMap<>();
            
            //lay ve cac bien theo ten
            for(int i=1;i<=cart.size();i++){
                //khai báo id=1;
                //do bên jsp khai báo name = product+id --> sau mỗi lần id++
                int idTemp = Integer.parseInt(request.getParameter("product"+i)); //product id
                //quantity cũng khai báo tên là quantity+id
                int quanTemp = Integer.parseInt(request.getParameter("quantity"+i));
                //add vào hashmap
                list.put(idTemp, quanTemp);
            }
            for (Map.Entry<Integer, Integer> entry : list.entrySet()) {
                Integer id = entry.getKey();
                Integer quantity = entry.getValue();
                for (Cart item : cart) {
                    if(item.getProductId()==id){
                        if(quantity == 0){
                            cart.remove(item);
                        }else{
                            item.setQuantity(quantity);
                        }
                        break;
                    }
                }
            }
            request.getSession().setAttribute("listCart", cart);
        response.sendRedirect("Cart");
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
