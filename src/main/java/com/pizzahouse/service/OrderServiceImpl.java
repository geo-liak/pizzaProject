/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Product;
import com.pizzahouse.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author stargazer
 */
@Service
public class OrderServiceImpl implements ProductService {

    @Autowired
    ProductRepository productRepository;

    @Override
    public List<Product> findAll() {
        List<Product> products = productRepository.findAll();
        return products;
    }

    @Override
    public List<Product> findAll(Specifications specifications) {

        List<Product> products = productRepository.findAll(specifications);
        return products;
    }

    @Override
    public Product find(Long id) {
        Product product = productRepository.findById(id);
        return product;
    }

    @Override
    public void delete(Long id) throws ResourceNotFoundException {
        checkExisting(id);

        productRepository.deleteById(id);
    }

    @Override
    public Product save(Product product) throws ResourceNotFoundException {

        checkExisting(product.getId());

        return productRepository.save(product);
    }

    private void checkExisting(Long id) throws ResourceNotFoundException {

        if (id != null) {
            Product existing = find(id);
            if (existing == null) {
                throw new ResourceNotFoundException("Entity not found");
            }
        }
    }

}
