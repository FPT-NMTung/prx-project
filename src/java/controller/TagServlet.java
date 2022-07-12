/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author kaiok
 */
public class TagServlet extends HttpServlet {

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
        List<Product> listProduct = new ArrayList<>();

        try {

            JAXBContext context = JAXBContext.newInstance(Products.class);
            Unmarshaller marshaller = context.createUnmarshaller();
//                Products products = (Products) marshaller.unmarshal(new File("web/client/products.xml"));
            Products products = (Products) marshaller.unmarshal(new File("D:/FPT/8-SUM2022/PRX301/Project/web/client/products.xml"));
            listProduct = products.getProducts();
            String textTag = request.getParameter("txtTag");
            List<Product> tagResult = new ArrayList<>();
            for (Product product : listProduct) {
                if (product.getTag().equalsIgnoreCase(textTag)) {
                    tagResult.add(product);
                }
            }
            request.setAttribute("listProduct", tagResult);
            request.getRequestDispatcher("client/home.jsp").forward(request, response);
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
