package com.pizzahouse.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author stargazer
 */
@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private int id;
    
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;
    
    @Column(name = "description")
    private String description;
    
    @Column(name = "ingredients")
    private String ingredients;
    
    @Column(name = "price")
    private float price;

    @Column(name = "imagePath")
    private String imagePath;
    
    public Product() {
    }

    public Product(String name, String description, String ingredients, float price, String imagePath) {
        this.name = name;
        this.description = description;
        this.ingredients = ingredients;
        this.price = price;
        this.imagePath = imagePath;
    }

    public Product(int id, String name, String description, String ingredients, float price, String imagePath) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.ingredients = ingredients;
        this.price = price;
        this.imagePath = imagePath;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", description=" + description + ", ingredients=" + ingredients + ", price=" + price + ", imagePath=" + imagePath + '}';
    }

    
    
    
    
    
    
    
}
