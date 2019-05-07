/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import com.pizzahouse.repository.UserRoleRepository;

/**
 * @author stargazer
 */
@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    UserRoleRepository userRoleRepository;

    
    @Override
    public UserRole find(Long id){
        return userRoleRepository.findById(id);
    }
    
    @Override
    public UserRole findByUserIdAndRoleId(Long userId, Long roleId){
        return userRoleRepository.findByUserIdAndRoleId(userId, roleId);
    }
    
    @Override
    public UserRole save(UserRole userRole) {
        return userRoleRepository.save(userRole);
    }

    
    
    @Override
    public List<UserRole> findByUserId(Long userId) {
        List<UserRole> userRole = userRoleRepository.findByUserId(userId);
        return userRole;
    }

    @Override
    public List<UserRole> findAll() {
        return userRoleRepository.findAll();
    }
    
    @Override
    public void delete(Long id) throws ResourceNotFoundException {
        userRoleRepository.deleteById(id);
    }


}
