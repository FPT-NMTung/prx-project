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
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import model.Cart;
import model.Order;
import model.Orders;

/**
 *
 * @author dohuy
 */
public class CheckoutController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        List<Cart> listCart = request.getSession().getAttribute("listCart") !=null ? (List<Cart>) request.getSession().getAttribute("listCart") : new ArrayList<>();
        
        if(listCart.size()>0){
            double total = 0;
            for (Cart cart : listCart) {
                total+= cart.getProductPrice() * cart.getQuantity();
            }
            request.setAttribute("total", total);
            request.getRequestDispatcher("./client/checkout.jsp").forward(request, response);
        }
        else request.getRequestDispatcher("home").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        List<Cart> listCart = (List<Cart>) request.getSession().getAttribute("listCart");
        
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String companyName = request.getParameter("companyName")!=null ? request.getParameter("companyName") : "";
        String billing_country = request.getParameter("billing_country");
        String street_address = request.getParameter("street_address");
        String apt_address = request.getParameter("apt_address") != null ? request.getParameter("apt_address") : "";
        String city_address = request.getParameter("city_address");
        String state_country = request.getParameter("state_country");
        String postCode = request.getParameter("postcode");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String note = request.getParameter("note")!=null ? request.getParameter("note") : "";
        
        //ghiorder
        Random rand = new Random();
        int n = rand.nextInt(9999);
        
        try {
            //get list order
            List<Order> listOrder = new ArrayList<>();
            JAXBContext context = JAXBContext.newInstance(Orders.class);
            Unmarshaller unmarshaller = context.createUnmarshaller();
            File file = new File(getServletContext().getRealPath("/client/orders.xml"));
            Orders orders = (Orders) unmarshaller.unmarshal(file);
            listOrder = orders.getOrders();
            
            double total = 0;
            for (Cart cart : listCart) {
                total+= cart.getProductPrice() * cart.getQuantity();
            }
            Order order = new Order();
            order.setId(n);
            order.setFirstName(firstName);
            order.setLastName(lastName);
            order.setCompanyName(companyName);
            order.setBilling_country(billing_country);
            order.setStreet_address(street_address);
            order.setApt_address(apt_address);
            order.setCity_address(city_address);
            order.setState_country(state_country);
            order.setPostCode(postCode);
            order.setPhone(phone);
            order.setEmail(email);
            order.setNote(note);
            order.setTotal(total);
            
            listOrder.add(order);
            
            //write to xml
            JAXBContext contextA = JAXBContext.newInstance(Orders.class);
            Marshaller marshaller = contextA.createMarshaller();
            marshaller.setProperty(javax.xml.bind.Marshaller.JAXB_FORMATTED_OUTPUT, true);
            marshaller.marshal(orders, file);
            // kill session
            request.getSession().invalidate();
            request.getRequestDispatcher("client/thank.jsp").forward(request, response);
        } catch (JAXBException e) {
            System.out.println(e.getMessage());
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
