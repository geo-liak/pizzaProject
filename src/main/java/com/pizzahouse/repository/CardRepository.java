/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.repository;

import com.pizzahouse.model.Card;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;


public interface CardRepository  extends JpaRepository<Card, Long>, JpaSpecificationExecutor<Card> {
    
    Card findById(Long id);
    
    List<Card> findByUserId(Long userId);

    @Modifying
    @Transactional
    void deleteById(Long id);
    
    
    
}
