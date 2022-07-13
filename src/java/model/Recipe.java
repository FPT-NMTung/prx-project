/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ntduo
 */
@XmlRootElement(name = "recipe")
public class Recipe {
    private int id;
    private String name;
    private String image;
    private String description;
    private String author;
    private String category;
    private String difficulty;
    private String prepTime;
    private String cookTime;
    private String totalTime;
    private List<Ingredient> ingredients;
    private Directions directions;

    public Recipe() {
    }

    public Recipe(int id, String name, String image, String description, String author, String category, String difficulty, String prepTime, String cookTime, String totalTime, List<Ingredient> ingredients, Directions directions) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.description = description;
        this.author = author;
        this.category = category;
        this.difficulty = difficulty;
        this.prepTime = prepTime;
        this.cookTime = cookTime;
        this.totalTime = totalTime;
        this.ingredients = ingredients;
        this.directions = directions;
    }

    
    public int getId() {
        return id;
    }

    @XmlAttribute(name = "id")
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    @XmlElement(name = "name")
    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    @XmlElement(name = "image")
    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    @XmlElement(name = "description")
    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthor() {
        return author;
    }

    @XmlElement(name = "author")
    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    @XmlElement(name = "category")
    public void setCategory(String category) {
        this.category = category;
    }

    public String getDifficulty() {
        return difficulty;
    }

    @XmlElement(name = "difficulty")
    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public String getPrepTime() {
        return prepTime;
    }

    @XmlElement(name = "prepTime")
    public void setPrepTime(String prepTime) {
        this.prepTime = prepTime;
    }

    public String getCookTime() {
        return cookTime;
    }

    @XmlElement(name = "cookTime")
    public void setCookTime(String cookTime) {
        this.cookTime = cookTime;
    }

    public String getTotalTime() {
        return totalTime;
    }

    @XmlElement(name = "totalTime")
    public void setTotalTime(String totalTime) {
        this.totalTime = totalTime;
    }

    public List<Ingredient> getIngredients() {
        return ingredients;
    }

    @XmlElement(name = "ingredients")
    public void setIngredients(List<Ingredient> ingredients) {
        this.ingredients = ingredients;
    }

    public Directions getDirections() {
        return directions;
    }

    @XmlElement(name = "directions")
    public void setDirections(Directions directions) {
        this.directions = directions;
    }
    
}
