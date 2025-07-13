package com.joe.aicustomer.mapper;

import com.joe.aicustomer.entity.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author JOE
 */
@Mapper
public interface ProductMapper {
    @Insert("INSERT INTO products (cn_name, en_name, category, brand_cn, brand_en, price, stock, specs, release_date) " +
            "VALUES (#{cnName}, #{enName}, #{category}, #{brandCn}, #{brandEn}, #{price}, #{stock}, #{specs}, #{releaseDate})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insert(Product product);

    @Update("UPDATE products SET cn_name=#{cnName}, en_name=#{enName}, category=#{category}, brand_cn=#{brandCn}, " +
            "brand_en=#{brandEn}, price=#{price}, stock=#{stock}, specs=#{specs}, release_date=#{releaseDate} " +
            "WHERE id=#{id}")
    void update(Product product);

    @Delete("DELETE FROM products WHERE id = #{id}")
    void delete(Integer id);

    @Select("SELECT * FROM products WHERE id = #{id}")
    Product selectById(Integer id);

    @Select("SELECT * FROM products")
    List<Product> selectAll();
}
