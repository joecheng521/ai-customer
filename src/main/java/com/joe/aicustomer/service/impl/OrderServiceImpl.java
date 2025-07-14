package com.joe.aicustomer.service.impl;

import com.joe.aicustomer.entity.Order;
import com.joe.aicustomer.enums.OrderStatus;
import com.joe.aicustomer.mapper.OrderMapper;
import com.joe.aicustomer.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author JOE
 */
@Slf4j
@Service
public class OrderServiceImpl implements OrderService {
    private final OrderMapper orderMapper;

    @Override
    public String updateOrderStatus(String id, OrderStatus status) {
        Order order = orderMapper.selectById(id);
        if (order == null) {
            return "订单不存在";
        }
        if (OrderStatus.COMPLETED.equals(order.getStatus())) {
            return "订单已完成,不可修改";
        }
        order.setStatus(status);
        order.setUpdatedAt(java.time.LocalDateTime.now());
        orderMapper.update(order);
        return "订单状态修改成功";
    }

    public OrderServiceImpl(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public void createOrder(Order order) {
        orderMapper.insert(order);
    }

    @Override
    public void updateOrder(Order order) {
        orderMapper.update(order);
    }

    @Override
    public void deleteOrder(String id) {
        orderMapper.delete(id);
    }

    @Override
    public Order getOrderById(String id) {
        return orderMapper.selectById(id);
    }

    @Override
    public List<Order> getAllOrders() {
        return orderMapper.selectAll();
    }
}