/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import model.Cart;
import model.Product;
import model.Products;

/**
 *
 * @author MSI - GL
 */
public class AddToCartController extends HttpServlet {

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
        String id = request.getParameter("productId");
//        String quantity = request.getParameter("quantity");
        List<Product> listProduct = new ArrayList<>();
        Product tempProduct = new Product();
        try {
            JAXBContext context = JAXBContext.newInstance(Products.class);
            Unmarshaller marshaller = context.createUnmarshaller();
            Products products = (Products) marshaller.unmarshal(new File(getServletContext().getRealPath("/client/products.xml")));
            listProduct = products.getProducts();

            //get product
            for (Product product : listProduct) {
                if (product.getId() == Integer.parseInt(id)) {
                    tempProduct = product;
                    break;
                }
            }

            Cart cart = new Cart(Integer.parseInt(id),
                    tempProduct.getName(),
                    tempProduct.getImage(),
                    tempProduct.getPrice(),
                    1,
                    tempProduct.getPrice());

            List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
            if (listCart == null) { //Cart is empty -> add new product
                listCart = new ArrayList<>();
                listCart.add(cart);
            } else { //product have been existed in cart -> quantity + 1
                boolean isProductExist = false;
                for (Cart c : listCart) {
                    if (c.getProductId() == Integer.parseInt(id)) { //product existed in cart
                        c.setQuantity(c.getQuantity() + 1);
                        isProductExist = true;
                    }
                }
                if (isProductExist == false) { //product not exist in cart 
                    listCart.add(cart);
                }
            }
            
            session.setAttribute("listCart", listCart); //update list cart
//            request.getRequestDispatcher("home").forward(request, response);
            response.sendRedirect("home");
        } catch (JAXBException e) {
            throw new RuntimeException(e);
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
