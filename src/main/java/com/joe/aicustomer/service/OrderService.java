package com.joe.aicustomer.service;

import com.joe.aicustomer.entity.Order;
import com.joe.aicustomer.enums.OrderStatus;

import java.util.List;

/**
 * @author JOE
 */
public interface OrderService {
    void createOrder(Order order);
    void updateOrder(Order order);
    void deleteOrder(String id);
    Order getOrderById(String id);
    List<Order> getAllOrders();
    String updateOrderStatus(String id, OrderStatus status);
}
