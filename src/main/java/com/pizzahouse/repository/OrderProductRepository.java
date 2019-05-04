/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.repository;

import com.pizzahouse.model.OrderProduct;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;


/**
 *
 * @author stargazer
 */
public interface OrderProductRepository  extends JpaRepository<OrderProduct, Long>, JpaSpecificationExecutor<OrderProduct> {

    OrderProduct findById(Long id);
    
    List<OrderProduct> findByOrderId(Long orderId);
    
    OrderProduct findByOrderIdAndProductId(Long orderId, Long productId);

    @Modifying
    @Transactional
    void deleteById(Long id);

    
}
