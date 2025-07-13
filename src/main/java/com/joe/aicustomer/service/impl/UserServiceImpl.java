package com.joe.aicustomer.service.impl;

import com.joe.aicustomer.entity.User;
import com.joe.aicustomer.mapper.UserMapper;
import com.joe.aicustomer.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author JOE
 */
@Service
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;

    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public void createUser(User user) {
        userMapper.insert(user);
    }

    @Override
    public void updateUser(User user) {
        userMapper.update(user);
    }

    @Override
    public void deleteUser(Integer id) {
        userMapper.delete(id);
    }

    @Override
    public User getUserById(Integer id) {
        return userMapper.selectById(id);
    }

    @Override
    public List<User> getAllUsers() {
        return userMapper.selectAll();
    }
}