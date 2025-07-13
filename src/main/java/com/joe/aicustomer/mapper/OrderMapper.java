package com.joe.aicustomer.mapper;

import com.joe.aicustomer.entity.Order;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author JOE
 */
@Mapper
public interface OrderMapper {
    @Insert("INSERT INTO orders (id, user_id, product_id, quantity, amount, status, created_at, updated_at) " +
            "VALUES (#{id}, #{userId}, #{productId}, #{quantity}, #{amount}, #{status}, #{createdAt}, #{updatedAt})")
    void insert(Order order);

    @Update("UPDATE orders SET user_id=#{userId}, product_id=#{productId}, quantity=#{quantity}, amount=#{amount}, " +
            "status=#{status}, updated_at=#{updatedAt} WHERE id=#{id}")
    void update(Order order);

    @Delete("DELETE FROM orders WHERE id = #{id}")
    void delete(String id);

    @Select("SELECT * FROM orders WHERE id = #{id}")
    Order selectById(String id);

    @Select("SELECT * FROM orders")
    List<Order> selectAll();
}