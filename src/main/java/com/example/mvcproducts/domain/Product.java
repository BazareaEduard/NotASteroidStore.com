package com.example.mvcproducts.domain;

import jakarta.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "products")
public class Product {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY) // Use IDENTITY for auto-increment in most databases
  private Long id;

  private String name;

  private String type; // You can switch this to an enum if needed
  private String applicationType;

  private String description;

  private double price;

  private String image;

  private boolean mostWanted;

  public Product() {}

  public Product(String name, String type, String applicationType, String description, double price, String image, boolean mostWanted) {
    this.name = name;
    this.type = type;
    this.applicationType = applicationType;
    this.description = description;
    this.price = price;
    this.image = image;
    this.mostWanted = mostWanted;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Product product = (Product) o;
    return Double.compare(product.price, price) == 0 &&
            Objects.equals(name, product.name) &&
            Objects.equals(type, product.type) &&
            Objects.equals(applicationType, product.applicationType) &&
            Objects.equals(description, product.description) &&
            Objects.equals(image, product.image);
  }

  @Override
  public int hashCode() {
    return Objects.hash(name, type, applicationType, description, price, image);
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public String getApplicationType() {
    return applicationType;
  }

  public void setApplicationType(String applicationType) {
    this.applicationType = applicationType;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }

  public String getImage() {
    return image;
  }

  public void setImage(String image) {
    this.image = image;
  }

  public boolean getMostWanted() {
    return mostWanted;
  }

  public void setMostWanted(boolean mostWanted) {
    this.mostWanted = mostWanted;
  }
}
