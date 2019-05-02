/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Order;
import com.pizzahouse.model.Product;
import org.springframework.data.jpa.domain.Specifications;

import java.util.List;

/**
 * @author stargazer
 */
public interface OrderService {

    List<Order> findAll();

    List<Order> findAll(Specifications specifications);

    Order find(Long id);

    void delete(Long id) throws ResourceNotFoundException;

    Order save(Order product) throws ResourceNotFoundException;

}
