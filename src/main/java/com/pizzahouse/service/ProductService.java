/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Product;
import org.springframework.data.jpa.domain.Specifications;

import java.util.List;

/**
 * @author stargazer
 */
public interface ProductService {

    List<Product> findAll();

    List<Product> findAll(Specifications specifications);

    Product find(Long id);

    void delete(Long id) throws ResourceNotFoundException;

    Product save(Product product) throws ResourceNotFoundException;

}
