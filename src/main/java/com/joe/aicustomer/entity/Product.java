package com.joe.aicustomer.entity;

import com.joe.aicustomer.enums.ProductCategory;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * @author JOE
 */
@Data
public class Product {
    private Integer id;
    private String cnName;
    private String enName;
    private ProductCategory category;
    private String brandCn;
    private String brandEn;
    private BigDecimal price;
    private Integer stock;
    private String specs;
    private LocalDate releaseDate;
}