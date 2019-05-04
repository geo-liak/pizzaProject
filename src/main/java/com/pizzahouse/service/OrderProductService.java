/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.OrderProduct;
import org.springframework.data.jpa.domain.Specifications;

import java.util.List;

/**
 * @author stargazer
 */
public interface OrderProductService {

    List<OrderProduct> findAll();

    List<OrderProduct> findAll(Specifications specifications);

    OrderProduct find(Long id);
    
    OrderProduct findByOrderIdAndProductId(Long orderId, Long productId);
    
    List<OrderProduct> findByOrderId(Long orderId);

    void delete(Long id) throws ResourceNotFoundException;

    OrderProduct save(OrderProduct order) throws ResourceNotFoundException;

}
