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
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import model.Product;
import model.Products;
import java.util.Random;

/**
 *
 * @author nmtun
 */
public class AdminProductCreateController extends HttpServlet {

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
        request.getRequestDispatcher("adminProductCreate.jsp").forward(request, response);
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
        request.getRequestDispatcher("adminProductCreate.jsp").forward(request, response);
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
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String longS = request.getParameter("long");
            String shortS = request.getParameter("short");
            String image = request.getParameter("image");
            String tag = request.getParameter("tag");
            double price = Double.parseDouble(request.getParameter("price"));

            List<Product> listProduct = new ArrayList<>();
            JAXBContext context = JAXBContext.newInstance(Products.class);
            Unmarshaller unmarshaller = context.createUnmarshaller();
            Products products = (Products) unmarshaller.unmarshal(new File(getServletContext().getRealPath("/client/products.xml")));
            listProduct = products.getProducts();
            
            Product newProduct = new Product();

            Random rand = new Random();
            int n = rand.nextInt(9999);            

            newProduct.setId(n);
            newProduct.setImage(image);
            newProduct.setName(name);
            newProduct.setPrice(price);
            newProduct.setLongDescription(longS);
            newProduct.setShortDescription(shortS);
            newProduct.setCategory(category);
            newProduct.setTag(tag);
            
            listProduct.add(newProduct);

            JAXBContext contextA = JAXBContext.newInstance(Products.class);
            Marshaller marshaller = contextA.createMarshaller();
            marshaller.setProperty(javax.xml.bind.Marshaller.JAXB_FORMATTED_OUTPUT, true);
            marshaller.marshal(products, new File(getServletContext().getRealPath("/client/products.xml")));
            
            response.sendRedirect(request.getContextPath() + "/admin/products");
        } catch (JAXBException e) {
            throw new RuntimeException(e);
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
