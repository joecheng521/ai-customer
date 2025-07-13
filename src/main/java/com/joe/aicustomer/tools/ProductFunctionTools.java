package com.joe.aicustomer.tools;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.joe.aicustomer.entity.Product;
import com.joe.aicustomer.enums.ProductCategory;
import com.joe.aicustomer.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.ai.tool.annotation.ToolParam;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * @author JOE
 */
@Slf4j
@Service
public class ProductFunctionTools {
    private final ProductService productService;

    public ProductFunctionTools(ProductService productService) {
        this.productService = productService;
    }

    @JsonInclude(JsonInclude.Include.NON_NULL)
    public record ProductDetails(Integer id,
                                 String cnName,
                                 String enName,
                                 ProductCategory category,
                                 String brandCn,
                                 String brandEn,
                                 BigDecimal price,
                                 Integer stock,
                                 String specs,
                                 LocalDate releaseDate) {

    }

    @Tool(description = "查询单个商品详细信息")
    public ProductDetails queryProductDetailsFunction(@ToolParam(description = "商品ID")
                                                      Integer id) {
        try {
            Product product = productService.getProductById(id);
            return toProductDetails(product);
        } catch (Exception e) {
            return new ProductDetails(id, null, null, null, null, null, null, null, null, null);
        }
    }


    private ProductDetails toProductDetails(Product product) {
        return new ProductDetails(product.getId(), product.getCnName(), product.getEnName(), product.getCategory(), product.getBrandCn(), product.getBrandEn(), product.getPrice(), product.getStock(), product.getSpecs(), product.getReleaseDate());
    }


}
