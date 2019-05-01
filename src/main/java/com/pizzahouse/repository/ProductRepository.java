/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.repository;

import com.pizzahouse.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 * @author stargazer
 */
public interface ProductRepository  extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {

    Product findById(Long id);

    @Modifying
    @Transactional
    void deleteById(Long id);

    
}
