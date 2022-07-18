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
 * @author dohuy
 */
@XmlRootElement(name = "order")
public class Order {
    private int id;
    private String firstName;
    private String lastName;
    private String companyName;
    private String billing_country;
    private String street_address;
    private String apt_address;
    private String city_address;
    private String state_country;
    private String postCode;
    private String phone;
    private String email;
    private String note;
    private double total;

    public Order() {
    }

    public Order(int id, String firstName, String lastName, String companyName, String billing_country, String street_address, String apt_address, String city_address, String state_country, String postCode, String phone, String email, String note, double total) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.companyName = companyName;
        this.billing_country = billing_country;
        this.street_address = street_address;
        this.apt_address = apt_address;
        this.city_address = city_address;
        this.state_country = state_country;
        this.postCode = postCode;
        this.phone = phone;
        this.email = email;
        this.note = note;
        this.total = total;
    }

    public int getId() {
        return id;
    }
    
    @XmlAttribute(name = "id")
    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }
    
    @XmlElement(name = "firstName")
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }
    
    @XmlElement(name = "lastName")
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getCompanyName() {
        return companyName;
    }
    
    @XmlElement(name = "companyName")
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getBilling_country() {
        return billing_country;
    }
    
    @XmlElement(name = "billing_country")
    public void setBilling_country(String billing_country) {
        this.billing_country = billing_country;
    }

    public String getStreet_address() {
        return street_address;
    }
    
    @XmlElement(name = "street_address")
    public void setStreet_address(String street_address) {
        this.street_address = street_address;
    }

    public String getApt_address() {
        return apt_address;
    }
    
    @XmlElement(name = "apt_address")
    public void setApt_address(String apt_address) {
        this.apt_address = apt_address;
    }

    public String getCity_address() {
        return city_address;
    }
    
    @XmlElement(name = "city_address")
    public void setCity_address(String city_address) {
        this.city_address = city_address;
    }

    public String getState_country() {
        return state_country;
    }
    
    @XmlElement(name = "state_country")
    public void setState_country(String state_country) {
        this.state_country = state_country;
    }

    public String getPostCode() {
        return postCode;
    }
    
    @XmlElement(name = "postCode")
    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getPhone() {
        return phone;
    }
    
    @XmlElement(name = "phone")
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }
    
    @XmlElement(name = "email")
    public void setEmail(String email) {
        this.email = email;
    }

    public String getNote() {
        return note;
    }
    
    @XmlElement(name = "note")
    public void setNote(String note) {
        this.note = note;
    }

    public double getTotal() {
        return total;
    }
    
    @XmlElement(name = "total")
    public void setTotal(double total) {
        this.total = total;
    }
}
