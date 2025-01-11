package com.example.mvcproducts.domain;

import jakarta.persistence.*;
import java.util.HashMap;
import java.util.Map;

@Entity
public class Cart {

    @Id
    @GeneratedValue
    private Long id;

    @OneToOne
    private User user;

    @ElementCollection
    private Map<Product, Integer> products = new HashMap<>();

    // Add product to cart
    public void addProduct(Product product) {
        products.put(product, products.getOrDefault(product, 0) + 1);
    }

    // Remove product from cart
    public void removeProduct(Product product) {
        products.remove(product);
    }

    // Update product quantity in cart
    public void updateProductQuantity(Product product, int quantity) {
        if (quantity <= 0) {
            products.remove(product);
        } else {
            products.put(product, quantity);
        }
    }

    public Map<Product, Integer> getProducts() {
        return products;
    }

    public void setProducts(Map<Product, Integer> products) {
        this.products = products;
    }
}