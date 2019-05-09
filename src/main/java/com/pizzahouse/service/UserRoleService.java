/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.UserRole;

import java.util.List;

/**
 * @author stargazer
 */
public interface UserRoleService {

    UserRole find(Long id);
    
    List<UserRole> findByRoleId(Long roleId);
    
    List<UserRole> findByUserId(Long userId);
    
    UserRole findByUserIdAndRoleId(Long userId, Long roleId);

    public List<UserRole> findAll();
    
    UserRole save(UserRole userRole);

    void delete(Long id) throws ResourceNotFoundException;
}
