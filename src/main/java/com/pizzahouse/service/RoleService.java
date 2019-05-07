/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.model.Role;

import java.util.List;
import java.util.Map;

/**
 * @author stargazer
 */
public interface RoleService {

    List<Role> findAll();

    Map<Long, Role> asMap();
}
