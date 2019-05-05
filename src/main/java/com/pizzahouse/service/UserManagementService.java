/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.User;
import org.springframework.data.jpa.domain.Specifications;

import java.util.List;
import java.util.Map;

/**
 * @author stargazer
 */
public interface UserManagementService {

    List<User> findAll();

    List<User> findAll(Specifications specifications);
    
    Map<Long, User> asMap();

    User find(Long id);

    void delete(Long id) throws ResourceNotFoundException;

    User save(User user) throws ResourceNotFoundException;

}
