package com.pizzahouse.controller;

import com.pizzahouse.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/")
public class ProductController {

//    @Autowired
//    ProductService productService;


    @RequestMapping(value = "/menu", method = RequestMethod.GET)
    public String productsMenu(Model model) {
//        model.addAttribute("menu", productService.findAllProducts());
        model.addAttribute("menu", "asdasdasdas");
        return "orders/products"; 
    }

}
