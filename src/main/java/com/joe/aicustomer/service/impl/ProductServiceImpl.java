package com.joe.aicustomer.service.impl;

import com.joe.aicustomer.entity.Product;
import com.joe.aicustomer.mapper.ProductMapper;
import com.joe.aicustomer.service.ProductService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author JOE
 */
@Service
public class ProductServiceImpl implements ProductService {
    private final ProductMapper productMapper;

    public ProductServiceImpl(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    @Override
    public void createProduct(Product product) {
        productMapper.insert(product);
    }

    @Override
    public void updateProduct(Product product) {
        productMapper.update(product);
    }

    @Override
    public void deleteProduct(Integer id) {
        productMapper.delete(id);
    }

    @Override
    public Product getProductById(Integer id) {
        return productMapper.selectById(id);
    }

    @Override
    public List<Product> getAllProducts() {
        return productMapper.selectAll();
    }
}
