/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Role;
import com.pizzahouse.model.User;
import com.pizzahouse.repository.RoleRepository;
import com.pizzahouse.repository.UserManagementRepository;
import com.pizzahouse.repository.UserRepository;
import java.util.HashMap;
import java.util.HashSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @author stargazer
 */
@Service
public class UserManagementServiceImpl implements UserManagementService {

    @Autowired
    UserManagementRepository userManagementRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public List<User> findAll() {
        List<User> users = userManagementRepository.findAll();
        return users;
    }

    @Override
    public List<User> findAll(Specifications specifications) {

        List<User> users = userManagementRepository.findAll(specifications);
        return users;
    }

    @Override
    public Map<Long, User> asMap() {
        Map<Long, User> map = new HashMap<>();
        List<User> users = findAll();
        for (User user : users) {
            map.put(user.getId(), user);
        }
        return map;
    }

    @Override
    public Map<Long, Role> roleAsMap() {
        Map<Long, Role> map = new HashMap<>();
        List<Role> roles = roleRepository.findAll();
        for (Role role : roles) {
            map.put(role.getId(), role);
        }
        return map;
    }

    @Override
    public User find(Long id) {
        User user = userManagementRepository.findById(id);
        return user;
    }

    @Override
    public void delete(Long id) throws ResourceNotFoundException {
        checkExisting(id);

        userManagementRepository.deleteById(id);
    }

    @Override
    public User save(User user) throws ResourceNotFoundException {

        checkExisting(user.getId());

        return userManagementRepository.save(user);
    }

    @Override
    public User saveNew(User user, String desiredRole) throws ResourceNotFoundException {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Set<Role> role = new HashSet();
        if ( "employees".equals(desiredRole) ) {
            role.add(roleRepository.findByName("ROLE_EMPLOYEE"));
        } else {
            role.add(roleRepository.findByName("ROLE_CUSTOMER"));
        }
        user.setRoles(role);
        userRepository.save(user);
        return user;
    }

    private void checkExisting(Long id) throws ResourceNotFoundException {

        if (id != null) {
            User existing = find(id);
            if (existing == null) {
                throw new ResourceNotFoundException("Entity not found");
            }
        }
    }

}
