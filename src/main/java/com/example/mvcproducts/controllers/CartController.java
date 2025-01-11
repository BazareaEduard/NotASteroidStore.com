package com.example.mvcproducts.controllers;

import com.example.mvcproducts.domain.*;
import com.example.mvcproducts.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@SessionAttributes("cart")
@Controller
public class CartController {

    @Autowired
    private ProductService productService;

    @ModelAttribute("cart")
    public Cart cart() {
        return new Cart();
    }

    // Add product to cart
    @GetMapping("/cart/add")
    public String addToCart(@RequestParam Long pid, @ModelAttribute("cart") Cart cart) {
        Product product = productService.findById(pid);
        cart.addProduct(product);
        return "redirect:/cart";
    }

    // Update product quantity in cart
    @PostMapping("/cart/update")
    public String updateCart(@RequestParam Long pid, @RequestParam int quantity, @ModelAttribute("cart") Cart cart) {
        Product product = productService.findById(pid);
        cart.updateProductQuantity(product, quantity);
        return "redirect:/cart";
    }

    // Remove product from cart
    @GetMapping("/cart/remove")
    public String removeFromCart(@RequestParam Long pid, @ModelAttribute("cart") Cart cart) {
        Product product = productService.findById(pid);
        cart.removeProduct(product);
        return "redirect:/cart";
    }

    // View cart
    @GetMapping("/cart")
    public String showCart(@ModelAttribute("cart") Cart cart, Model model) {
        double total = cart.getProducts().entrySet().stream()
                .mapToDouble(entry -> entry.getKey().getPrice() * entry.getValue())
                .sum();
        float roundedValue = Math.round(total * 100) / 100.0f;
        model.addAttribute("cart", cart);
        model.addAttribute("total", roundedValue);
        return "cart";
    }

    // Place order
    @PostMapping("/cart/order")
    public String placeOrder(@ModelAttribute("cart") Cart cart, Model model) {
        // Placeholder logic for order placement
        // You can save the order to the database here
        cart.getProducts().clear(); // Clear the cart after placing the order
        return "redirect:/cart";
    }
}
