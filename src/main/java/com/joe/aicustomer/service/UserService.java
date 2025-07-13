package com.joe.aicustomer.service;

import com.joe.aicustomer.entity.User;

import java.util.List;

/**
 * @author JOE
 */
public interface UserService {
    void createUser(User user);
    void updateUser(User user);
    void deleteUser(Integer id);
    User getUserById(Integer id);
    List<User> getAllUsers();
}
