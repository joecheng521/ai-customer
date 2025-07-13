package com.joe.aicustomer.entity;

import com.joe.aicustomer.enums.OrderStatus;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @author JOE
 */
@Data
public class Order {
    private String id;
    private Integer userId;
    private Integer productId;
    private Integer quantity;
    private BigDecimal amount;
    private OrderStatus status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}