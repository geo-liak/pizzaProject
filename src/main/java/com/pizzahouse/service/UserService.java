package com.pizzahouse.service;

import com.pizzahouse.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
