package com.pizzahouse.controller;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Product;
import com.pizzahouse.model.specifications.ProductSpecification;
import com.pizzahouse.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.ConstraintViolationException;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/products")
public class ProductController extends AbstractController {

    @Autowired
    ProductService productService;


    @RequestMapping(value = "/menu", method = RequestMethod.GET)
    public String productsMenu(Model model) {
        model.addAttribute("products", productService.findAll());
        return "pages/menu";
    }


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model,
			@RequestParam(value = "query", required = false, defaultValue = "") String query) {

        if (query != null && query.trim().length() > 0) {
            model.addAttribute("products", productService.findAll(Specifications.where(ProductSpecification.containsText(query))));
        } else {
            model.addAttribute("products", productService.findAll());
        }

        return "pages/products/list";
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Model theModel, @RequestParam(name = "id", required = false) Long id) {
        if (id == null) {
            theModel.addAttribute("product", new Product());
        } else {
            Product product = productService.find(id);
            theModel.addAttribute("product", product);
        }
        return "pages/products/edit";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String save(Model theModel, @ModelAttribute("product") @Valid Product product, BindingResult bindingResult) {

        List<String> errors = new ArrayList<>();
        try {
            product = productService.save(product);
        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }

        if (bindingResult.hasErrors()) {
            theModel.addAttribute("product", product);

            return "pages/products/edit";
        } else {
            return "redirect:pages/products/list";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") Long id) throws ResourceNotFoundException {
        productService.delete(id);
        return "redirect:pages/products/list";
    }
}
