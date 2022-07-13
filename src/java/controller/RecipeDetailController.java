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
import model.Recipe;
import model.Recipes;

/**
 *
 * @author ntduo
 */
public class RecipeDetailController extends HttpServlet {

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
        List<Recipe> listRecipe = new ArrayList<>();
        String id = request.getParameter("recipeId");
        
        try {
            JAXBContext context = JAXBContext.newInstance(Recipes.class);
            Unmarshaller marshaller = context.createUnmarshaller();
            File file = new File(getServletContext().getRealPath("/client/recipe.xml"));
            Recipes recipes = (Recipes) marshaller.unmarshal(file);
            listRecipe = recipes.getRecipes();
            
            Recipe tempRecipe = new Recipe();
            for (Recipe recipe : listRecipe) {
                if (recipe.getId() == Integer.parseInt(id)) {
                    tempRecipe = recipe;
                    break;
                }
            }
            request.setAttribute("recipe", tempRecipe);
            request.setAttribute("ingredients", tempRecipe.getIngredients());
            request.getRequestDispatcher("client/recipes_detail.jsp").forward(request, response);
         //   response.sendRedirect("client/recipes_detail.jsp");
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
