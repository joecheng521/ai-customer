package com.joe.aicustomer.tools;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.joe.aicustomer.entity.Order;
import com.joe.aicustomer.enums.OrderStatus;
import com.joe.aicustomer.service.OrderService;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.ai.tool.annotation.ToolParam;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @author JOE
 */
@Service
public class OrderFunctionTools {
    private final OrderService orderService;

    public OrderFunctionTools(OrderService orderService) {
        this.orderService = orderService;
    }

    @JsonInclude(JsonInclude.Include.NON_NULL)
    public record OrderDetails(String id, Integer userId, Integer productId, Integer quantity, BigDecimal amount,
                               OrderStatus status, LocalDateTime createdAt) {

    }

    public record OrderDetailsRequest(String id, Integer userId, Integer productId, Integer quantity, BigDecimal amount,
                                      OrderStatus status, LocalDateTime createdAt) {
    }

    @Tool(description = "查询单个订单信息")
    public OrderDetails queryOrderDetailsFunction(@ToolParam(description = "订单编号") String id) {
        try {
            Order order = orderService.getOrderById(id);
            if (order == null) {
                return new OrderDetails(id, null, null, null, null, null, null);
            }
            return toOrderDetails(order);
        } catch (Exception e) {
            return new OrderDetails(id, null, null, null, null, null, null);
        }
    }

    @Tool(description = "修改订单状态")
    public String updateOrderStatusFunction(@ToolParam(description = "订单编号") String id,
                                            @ToolParam(description = "订单状态") OrderStatus status) {
        return orderService.updateOrderStatus(id, status);
    }


    private OrderDetails toOrderDetails(Order order) {
        return new OrderDetails(order.getId(), order.getUserId(), order.getProductId(), order.getQuantity(), order.getAmount(), order.getStatus(), order.getCreatedAt());
    }


}
