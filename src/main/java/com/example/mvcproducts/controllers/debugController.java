package com.example.mvcproducts.controllers;

import com.example.mvcproducts.domain.Product;
import com.example.mvcproducts.services.ProductService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api")
public class debugController {
    private final ProductService productService;

    public debugController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/test-products")
    public List<Product> getProducts() {
        return productService.findAll();
    }

    @GetMapping("test-product-type")
    public List<String> getProductType() {
        List<Product> products = productService.findAll();
        List<String> types = new ArrayList<>();
        products.forEach(product -> {
            types.add("Product: " + product.getName() + ", ApplicationType: " + product.getApplicationType());
        });
        return types;
    }
}
