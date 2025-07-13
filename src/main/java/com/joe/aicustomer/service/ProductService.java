package com.joe.aicustomer.service;

import com.joe.aicustomer.entity.Product;

import java.util.List;

/**
 * @author JOE
 */
public interface ProductService {
    void createProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(Integer id);
    Product getProductById(Integer id);
    List<Product> getAllProducts();
}
