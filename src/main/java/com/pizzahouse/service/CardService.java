/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Card;
import java.util.List;

public interface CardService {
    
    List<Card> findAll();

    List<Card> findByUserId(Long userId);

    Card find(Long id);

    void delete(Long id) throws ResourceNotFoundException;

    Card save(Card card) throws ResourceNotFoundException;
}
