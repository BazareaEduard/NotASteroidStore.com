package com.example.mvcproducts.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/faq")
public class FaqController {

    @GetMapping
    public String seeFAQ(Model model, Authentication authentication) {
        // Add any necessary attributes to the model if needed
        if (authentication != null && authentication.isAuthenticated()) {
            // If needed, you can use the authentication object
            // to get user details or roles
        }
        return "faq"; // This should correspond to the name of your Thymeleaf template (faq.html)
    }
}