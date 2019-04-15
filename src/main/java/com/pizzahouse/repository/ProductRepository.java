/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.repository;

import com.pizzahouse.model.Product;
import com.pizzahouse.model.User;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author stargazer
 */

public interface ProductRepository extends JpaRepository<Product, Long> {
    
//    List<Product> findAllProducts();
    
//    Product findProductById (Long id);
//    
//    void deleteProductById (Long id);
//    
//    void createProduct (Product product);
//    
//    void updateProduct (Product product);
    
    Product findById(Long id);

    void deleteById(Long id);
}
