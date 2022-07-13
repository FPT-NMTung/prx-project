/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ntduo
 */
@XmlRootElement(name = "recipes")
public class Recipes {

    private List<Recipe> recipes;

    public Recipes() {
    }

    public List<Recipe> getRecipes() {
        return recipes;
    }

    @XmlElement(name = "recipe")
    public void setRecipes(List<Recipe> recipes) {
        this.recipes = recipes;
    }

    public Recipes(List<Recipe> recipes) {
        this.recipes = recipes;
    }

}
