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
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import model.Product;
import model.Products;

/**
 *
 * @author MSI - GL
 */
public class ProductDetailController extends HttpServlet {

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
        /* TODO output your page here. You may use following sample code. */
        String id = request.getParameter("productId");
        List<Product> listProduct = new ArrayList<>();
        Product tempProduct = new Product();
        try {

            JAXBContext context = JAXBContext.newInstance(Products.class);
            Unmarshaller marshaller = context.createUnmarshaller();
            File file = new File("D:/FPT/8-SUM2022/PRX301/Project/web/client/products.xml");
            Products products = (Products) marshaller.unmarshal(file);
            listProduct = products.getProducts();

            //get product
            for (Product product : listProduct) {
                if (product.getId() == Integer.parseInt(id)) {
                    tempProduct = product;
                    break;
                }
            }

            //get list related product
            List<Product> listRelatedProduct = new ArrayList<>();
            for (Product product : listProduct) {
                if (product.getTag().equals(tempProduct.getTag()) || product.getCategory().equals(tempProduct.getCategory())) {
                    listRelatedProduct.add(product);
                }
            }
            
            request.setAttribute("listRelatedProduct", listRelatedProduct);
            request.setAttribute("product", tempProduct);
            request.getRequestDispatcher("client/product-detail.jsp").forward(request, response);
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
