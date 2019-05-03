/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Order;
import com.pizzahouse.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author stargazer
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderRepository orderRepository;

    @Override
    public List<Order> findAll() {
        List<Order> orders = orderRepository.findAll();
        return orders;
    }

    @Override
    public List<Order> findAll(Specifications specifications) {

        List<Order> orders = orderRepository.findAll(specifications);
        return orders;
    }

    @Override
    public Order find(Long id) {
        Order order = orderRepository.findById(id);
        return order;
    }

    @Override
    public void delete(Long id) throws ResourceNotFoundException {
        checkExisting(id);

        orderRepository.deleteById(id);
    }

    @Override
    public Order save(Order order) throws ResourceNotFoundException {

        checkExisting(order.getId());

        return orderRepository.save(order);
    }

    private void checkExisting(Long id) throws ResourceNotFoundException {

        if (id != null) {
            Order existing = find(id);
            if (existing == null) {
                throw new ResourceNotFoundException("Entity not found");
            }
        }
    }

}
