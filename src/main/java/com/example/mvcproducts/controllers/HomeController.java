package com.example.mvcproducts.controllers;

import com.example.mvcproducts.domain.Role;
import com.example.mvcproducts.domain.User;
import com.example.mvcproducts.services.UserService;
import com.example.mvcproducts.services.ProductService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;

@Controller
public class HomeController {

  private final UserService userService;
  private final PasswordEncoder passwordEncoder;
  private final ProductService productService;

  public HomeController(UserService userService, PasswordEncoder passwordEncoder, ProductService productService) {
    this.userService = userService;
    this.passwordEncoder = passwordEncoder;
    this.productService = productService;
  }

  @RequestMapping("/")
  public String home(Model model) {
    model.addAttribute("products", productService.findAll());
    return "home";
  }

  @RequestMapping("/register")
  public String register(Model model) {
    model.addAttribute("user", new User());
    model.addAttribute("products", productService.findAll());
    return "register.html";
  }

  @RequestMapping("/register/error")
  public String registerError(Model model) {
    model.addAttribute("registerError", true);
    return "register.html";
  }

  // Login form
  @RequestMapping("/login")
  public String login() {
    return "login.html";
  }

  // Login form with error
  @RequestMapping("/login/error")
  public String loginError(Model model) {
    model.addAttribute("loginError", true);
    return "login.html";
  }

  @PostMapping("/register")
  public String registerUser(@ModelAttribute User user, Model model) {
    if (userService.findByUsername(user.getUsername()) != null) {
      model.addAttribute("registerError", true);
      return "register.html";
    }

    user.setPassword(passwordEncoder.encode(user.getPassword()));
    user.setRoles(Collections.singletonList(Role.ROLE_USER));
    userService.save(user);
    return "redirect:/login";
  }
}
