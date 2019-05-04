/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.OrderProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;

import java.util.List;
import com.pizzahouse.repository.OrderProductRepository;

/**
 * @author stargazer
 */
@Service
public class OrderProductServiceImpl implements OrderProductService {

    @Autowired
    OrderProductRepository orderRepository;

    @Override
    public List<OrderProduct> findAll() {
        List<OrderProduct> orders = orderRepository.findAll();
        return orders;
    }

    @Override
    public List<OrderProduct> findAll(Specifications specifications) {

        List<OrderProduct> orders = orderRepository.findAll(specifications);
        return orders;
    }

    @Override
    public OrderProduct find(Long id) {
        return orderRepository.findById(id);
    }
    
    @Override
    public OrderProduct findByOrderIdAndProductId(Long orderId, Long productId) {
        return orderRepository.findByOrderIdAndProductId(orderId, productId);
    }
   
    @Override
    public List<OrderProduct> findByOrderId(Long orderId) {
        return orderRepository.findByOrderId(orderId);
    }

    @Override
    public void delete(Long id) throws ResourceNotFoundException {
        checkExisting(id);

        orderRepository.deleteById(id);
    }

    @Override
    public OrderProduct save(OrderProduct order) throws ResourceNotFoundException {

        checkExisting(order.getId());

        return orderRepository.save(order);
    }

    private void checkExisting(Long id) throws ResourceNotFoundException {

        if (id != null) {
            OrderProduct existing = find(id);
            if (existing == null) {
                throw new ResourceNotFoundException("Entity not found");
            }
        }
    }

}
