
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
@Table (name = "order_product")
public class Order {
    
    @Id
    @GeneratedValue
    @Column(name="id")
    private Long id;
    
    @Column(name="product_id")
    private Long productId;
    
    @Column(name="quantity")
    private Long quantity;
    
    @Column(name="order_id")
    private Long orderId;

    public Order() {
    }

    public Order(Long productId, Long quantity, Long orderId) {
        this.productId = productId;
        this.quantity = quantity;
        this.orderId = orderId;
    }

    public Order(Long id, Long productId, Long quantity, Long orderId) {
        this.id = id;
        this.productId = productId;
        this.quantity = quantity;
        this.orderId = orderId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", productId=" + productId + ", quantity=" + quantity + ", orderId=" + orderId + '}';
    }


    
    
}
