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
@XmlRootElement(name = "ingredients")
public class Ingredients {

    private List<Ingredient> ingredients;

    public Ingredients() {
    }

    public List<Ingredient> getIngredients() {
        return ingredients;
    }

    @XmlElement(name = "ingredient")
    public void setIngredients(List<Ingredient> ingredients) {
        this.ingredients = ingredients;
    }

}
