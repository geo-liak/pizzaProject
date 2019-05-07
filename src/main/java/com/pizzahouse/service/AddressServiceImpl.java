/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pizzahouse.service;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Address;
import com.pizzahouse.model.OrderProduct;
import com.pizzahouse.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author stargazer
 */
@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
   AddressRepository addressRepository;

    @Override
    public List<Address> findAll() {
        List<Address> address = addressRepository.findAll();
        return address;
    }

    @Override
    public Address find(Long id) {
        return addressRepository.findById(id);
    }

    @Override
    public void delete(Long id) throws ResourceNotFoundException {
        checkExisting(id);

        addressRepository.deleteById(id);
    }

    @Override
    public Address save(Address address) throws ResourceNotFoundException {

        checkExisting(address.getId());

        return addressRepository.save(address);
    }

    private void checkExisting(Long id) throws ResourceNotFoundException {

        if (id != null) {
            Address existing = find(id);
            if (existing == null) {
                throw new ResourceNotFoundException("Entity not found");
            }
        }
    }

}
