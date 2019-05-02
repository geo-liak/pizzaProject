
package com.pizzahouse.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author stargazer
 */

@Entity
@Table (name = "order")
public class Order {
    
    @Id
    @GeneratedValue
    @Column(name="id")
    private Long id;
    
    @Column(name="item")
    private Long item;
    
    @Column(name="quantity")
    private Long quantity;
    
    @Column(name="fk_order")
    private Long fk_order;

    public Order() {
    }

    public Order(Long item, Long quantity, Long fk_order) {
        this.item = item;
        this.quantity = quantity;
        this.fk_order = fk_order;
    }

    public Order(Long id, Long item, Long quantity, Long fk_order) {
        this.id = id;
        this.item = item;
        this.quantity = quantity;
        this.fk_order = fk_order;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getItem() {
        return item;
    }

    public void setItem(Long item) {
        this.item = item;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public Long getFk_order() {
        return fk_order;
    }

    public void setFk_order(Long fk_order) {
        this.fk_order = fk_order;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", item=" + item + ", quantity=" + quantity + ", fk_order=" + fk_order + '}';
    }
    
    
    
}
