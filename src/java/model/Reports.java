/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author YOMATASHI
 */
public class Reports implements Serializable{
    String fruit_name;
    int qty_sold;

    public Reports() {
    }

    public String getFruit_name() {
        return fruit_name;
    }

    public void setFruit_name(String fruit_name) {
        this.fruit_name = fruit_name;
    }

    public int getQty_sold() {
        return qty_sold;
    }

    public void setQty_sold(int qty_sold) {
        this.qty_sold = qty_sold;
    }
    
}
