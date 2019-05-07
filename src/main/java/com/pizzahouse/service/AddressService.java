/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Address;
import com.pizzahouse.model.OrderProduct;

import java.util.List;

/**
 * @author stargazer
 */
public interface AddressService {

    List<Address> findAll();

    Address find(Long id);

    void delete(Long id) throws ResourceNotFoundException;

    Address save(Address address) throws ResourceNotFoundException;

}
