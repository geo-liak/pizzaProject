/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.model.Product;
import com.pizzahouse.repository.ProductRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author stargazer
 */
@Service()
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductRepository productRepository;

//    @Override
//    public List<Product> findAllProducts() {
//        List<Product> menu = productRepository.findAllProducts();
//        return menu;
//    }
//    
//    @Override
//    public Product findProductById(String id) {
//            Product product = productRepository.findProductById(id);
//    return product;
//    }
//
//    @Override
//    public void deleteProductById(String id) {
//        void productRepository.deleteProductById(id);
//    }
//
//    @Override
//    public void createProduct(Product product) {
////        void productRepository.createProduct(product);
//    }
//
//    @Override
//    public void updateProduct(Product product) {
//    }

   @Override
    public List<Product> findAllProducts() {
        List<Product> menu = productRepository.findAll();
        return menu;
    }
    
    @Override
    public Product findProductById(Long id) {
        Product product = productRepository.findById(id);
        return product;
    }
}


