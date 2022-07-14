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
@XmlRootElement(name = "direction")
public class Direction {
    private int step;
    private String content;

    public Direction() {
    }

    public Direction(int step, String content) {
        this.step = step;
        this.content = content;
    }

    public int getStep() {
        return step;
    }

    @XmlAttribute(name = "step")
    public void setStep(int step) {
        this.step = step;
    }
    
    public String getContent() {
        return content;
    }

     @XmlValue
    public void setContent(String content) {
        this.content = content;
    }
    
    
}
