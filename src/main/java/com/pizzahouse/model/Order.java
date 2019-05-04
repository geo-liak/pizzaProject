
package com.pizzahouse.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author stargazer
 */

@Entity
@Table(name="orders")
public class Order {
    
    private Long id;
    
    private Double price;
    
    private Long userId;
    
    private Long addressId;
    
    private Date orderDate;
    
    private Integer progress;

    public Order() {
    }

    public Order(Double price, Long userId, Long addressId, Date orderDate, Integer progress) {
        this.price = price;
        this.userId = userId;
        this.addressId = addressId;
        this.orderDate = orderDate;
        this.progress = progress;
    }

    public Order(Long id, Double price, Long userId, Long addressId, Date orderDate, Integer progress) {
        this.id = id;
        this.price = price;
        this.userId = userId;
        this.addressId = addressId;
        this.orderDate = orderDate;
        this.progress = progress;
    }

    

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name="price")
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Column(name="user_id")
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    @Column(name="address_id")
    public Long getAddressId() {
        return addressId;
    }

    public void setAddressId(Long addressId) {
        this.addressId = addressId;
    }

    @Column(name="order_date")
    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    @Column(name="progress")
    public Integer getProgress() {
        return progress;
    }

    public void setProgress(Integer progress) {
        this.progress = progress;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", price=" + price + ", userId=" + userId + ", addressId=" + addressId + ", orderDate=" + orderDate + ", progress=" + progress + '}';
    }

 
    
    
    
}
