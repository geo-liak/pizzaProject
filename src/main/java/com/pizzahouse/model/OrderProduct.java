
package com.pizzahouse.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

/**
 *
 * @author stargazer
 */

@Entity
@Table (name = "order_product")
public class OrderProduct {
    
    @Id
    @GeneratedValue
    @Column(name="id")
    private Long id;
    
    @NotNull
    @Column(name="product_id", nullable = false)
    private Long productId;
    
    @NotNull
    @Min(1)
    @Max(100)
    @Column(name="quantity", nullable = false)
    private Long quantity;
    
    @NotNull
    @Column(name="order_id", nullable = false)
    private Long orderId;

    public OrderProduct() {
    }

    public OrderProduct(Long productId, Long quantity, Long orderId) {
        this.productId = productId;
        this.quantity = quantity;
        this.orderId = orderId;
    }

    public OrderProduct(Long id, Long productId, Long quantity, Long orderId) {
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
