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
@XmlRootElement(name = "directions")
public class Directions {
    private List<Direction> directions;

    public Directions() {
    }

    public Directions(List<Direction> directions) {
        this.directions = directions;
    }

    public List<Direction> getDirections() {
        return directions;
    }

    @XmlElement(name = "direction")
    public void setDirections(List<Direction> directions) {
        this.directions = directions;
    }
    
}
