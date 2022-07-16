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

/**
 *
 * @author nmtun
 */
public class AdminProductDetailController extends HttpServlet {

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

    }

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
            String id = request.getParameter("id");
            
            List<Product> listProduct = new ArrayList<>();
            JAXBContext context = JAXBContext.newInstance(Products.class);
            Unmarshaller marshaller = context.createUnmarshaller();
            Products products = (Products) marshaller.unmarshal(new File(getServletContext().getRealPath("/client/products.xml")));
            listProduct = products.getProducts();
            Product select = new Product();
            System.out.println("id" + id);
            for (Product product : listProduct) {
                if (product.getId() == Integer.parseInt(id)) {
                    select = product;
                    break;
                }
            }            
            
            request.setAttribute("product", select);
            request.getRequestDispatcher("adminProductDetail.jsp").forward(request, response);
        } catch (JAXBException e) {
            throw new RuntimeException(e);
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
            int id = Integer.parseInt(request.getParameter("id"));
            
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
            Product select = new Product();
            
            for (Product product : listProduct) {
                if (product.getId() == id) {
                    select = product;
                    break;
                }
            }
            
            select.setImage(image);
            select.setName(name);
            select.setPrice(price);
            select.setLongDescription(longS);
            select.setShortDescription(shortS);
            select.setCategory(category);
            select.setTag(tag);
            
            JAXBContext contextA = JAXBContext.newInstance(Products.class);
            Marshaller marshaller = contextA.createMarshaller();
            marshaller.setProperty(javax.xml.bind.Marshaller.JAXB_FORMATTED_OUTPUT, true);
            marshaller.marshal(products, new File(getServletContext().getRealPath("/client/products.xml")));
            
            request.setAttribute("product", select);
            request.setAttribute("isSuccess", true);
            request.getRequestDispatcher("adminProductDetail.jsp").forward(request, response);
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
    }

}
