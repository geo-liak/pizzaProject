/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.repository;

import com.pizzahouse.model.Order;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;


/**
 *
 * @author stargazer
 */
public interface OrderRepository  extends JpaRepository<Order, Long>, JpaSpecificationExecutor<Order> {

    Order findById(Long id);
    
    Order findByUserIdAndProgress(Long userId, Integer progress);

    List<Order> findByProgress(Integer progress);
    
    @Modifying
    @Transactional
    void deleteById(Long id);

    
}
