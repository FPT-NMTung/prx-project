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
 * @author dohuy
 */
@XmlRootElement(name = "orders")
public class Orders {
    private List<Order> orders;

    public Orders() {
    }

    public Orders(List<Order> orders) {
        this.orders = orders;
    }

    public List<Order> getOrders() {
        return orders;
    }
    
    @XmlElement(name = "order")
    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}
