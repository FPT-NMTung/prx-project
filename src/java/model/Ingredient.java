/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlValue;

/**
 *
 * @author ntduo
 */
@XmlRootElement(name = "ingredient")
public class Ingredient {
    private String content;
    private int id;

    public Ingredient() {
    }

    public Ingredient(String content, int id) {
        this.content = content;
        this.id = id;
    }

    public int getId() {
        return id;
    }

    @XmlAttribute(name = "id")
    public void setId(int id) {
        this.id = id;
    }

    
    public String getContent() {
        return content;
    }

    @XmlValue
    public void setContent(String content) {
        this.content = content;
    }
    
}
