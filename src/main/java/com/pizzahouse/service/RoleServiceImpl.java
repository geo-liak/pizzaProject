/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.model.Product;
import com.pizzahouse.model.Role;
import com.pizzahouse.model.User;
import com.pizzahouse.repository.RoleRepository;
import com.pizzahouse.repository.UserManagementRepository;
import com.pizzahouse.repository.UserRepository;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @author stargazer
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public List<Role> findAll() {
        List<Role> users = roleRepository.findAll();
        return users;
    }

    
    @Override
    public Map<Long, Role> asMap() {
        Map<Long, Role> map = new HashMap<>();
        List<Role> roles = findAll();
        for (Role role: roles) {
            map.put(role.getId(), role);
        }
        return map;
    }

}
