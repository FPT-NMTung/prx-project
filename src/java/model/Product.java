/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author kaiok
 */
@XmlRootElement
public class Product {
    private int id;
    private String name;
    private double price;
    private String shortDescription ;
    private String longDescription;
    private String image;
    private String category;
    private String tag;

    public Product() {
    }

    public Product(int id, String name, double price, String shortDescription, String longDescription, String image, String category, String tag) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.shortDescription = shortDescription;
        this.longDescription = longDescription;
        this.image = image;
        this.category = category;
        this.tag = tag;
    }

    public int getId() {
        return id;
    }
@XmlAttribute(name= "id")
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
 @XmlElement(name= "name")
    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }
 @XmlElement(name= "price")
    public void setPrice(double price) {
        this.price = price;
    }

    public String getShortDescription() {
        return shortDescription;
    }
 @XmlElement(name= "shortDescription")
    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getLongDescription() {
        return longDescription;
    }
 @XmlElement(name= "longDescription")
    public void setLongDescription(String longDescription) {
        this.longDescription = longDescription;
    }

    public String getImage() {
        return image;
    }
 @XmlElement(name= "image")
    public void setImage(String image) {
        this.image = image;
    }

    public String getCategory() {
        return category;
    }
 @XmlElement(name= "category")
    public void setCategory(String category) {
        this.category = category;
    }

    public String getTag() {
        return tag;
    }
 @XmlElement(name= "tag")
    public void setTag(String tag) {
        this.tag = tag;
    }
    
            
    
}
