/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.repository;

import com.pizzahouse.model.Product;
import java.util.List;

/**
 *
 * @author stargazer
 */
public interface ProductRepository {
    
    List<Product> findAllProducts();
    
    Product findProductById (String id);
    
    void deleteProductById (String id);
    
    void createProduct (Product product);
    
    void updateProduct (Product product);
    
}
