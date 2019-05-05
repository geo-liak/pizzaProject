/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.model.Role;
import com.pizzahouse.model.User;
import com.pizzahouse.repository.RoleRepository;
import com.pizzahouse.repository.UserManagementRepository;
import com.pizzahouse.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
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


}
