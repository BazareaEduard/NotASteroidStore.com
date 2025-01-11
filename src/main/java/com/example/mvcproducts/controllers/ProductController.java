package com.example.mvcproducts.controllers;

import com.example.mvcproducts.domain.Product;
import com.example.mvcproducts.domain.User;
import com.example.mvcproducts.services.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private final ProductService productService;
    private static final Logger log = LoggerFactory.getLogger(ProductsController.class);

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping
    public String seeProducts(Model model, Authentication authentication) {
        model.addAttribute("products", productService.findAll());
        User user = (User) authentication.getPrincipal();
        log.info(user.getUsername());
        return "product";
    }

    @PostMapping
    public String addProduct(Product product) {
        log.info(product.toString());
        productService.save(product);
        return "redirect:/product";
    }

    @GetMapping("{id}")
    public String getProductPage(@PathVariable Long id, Model model) {
        log.info("Fetching product with ID: {}", id);
        Product product = productService.findById(id);
        if (product == null) {
            log.error("Product not found for ID: {}", id);
            throw new RuntimeException("Product not found for ID: " + id);
        }
        model.addAttribute("product", product);
        log.info("Product retrieved: {}, {}", product.getName(), product.getPrice());
        return "product";
    }
}