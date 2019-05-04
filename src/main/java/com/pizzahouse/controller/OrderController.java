package com.pizzahouse.controller;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Order;
import com.pizzahouse.model.OrderProduct;
import com.pizzahouse.model.specifications.OrderSpecification;
import com.pizzahouse.service.OrderProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import com.pizzahouse.service.OrderService;
import com.pizzahouse.service.ProductService;

@Controller
@RequestMapping(value = "/orders")
public class OrderController extends AbstractController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderProductService orderProductService;
    
    @Autowired
    private ProductService productService;

    
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model,
            @RequestParam(value = "query", required = false, defaultValue = "") String query) {

        if (query != null && query.trim().length() > 0) {
            model.addAttribute("orders", orderService.findAll(Specifications.where(OrderSpecification.containsText(query))));
        } else {
            model.addAttribute("orders", orderService.findAll());
        }

        return "pages/orders/list";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Model theModel, @RequestParam(name = "id", required = false) Long id) {
        if (id == null) {
            theModel.addAttribute("order", new Order());
        } else {
            Order order = orderService.find(id);
            List<OrderProduct> orderProducts = orderProductService.findByOrderId(order.getId());
            theModel.addAttribute("order", order);
            theModel.addAttribute("orderProducts", orderProducts);
            theModel.addAttribute("productsMap", productService.asMap());
        }
        return "pages/orders/edit";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String save(Model theModel, @ModelAttribute("order") @Valid Order order, BindingResult bindingResult) {

        List<String> errors = new ArrayList<>();
        try {
            order = orderService.save(order);
        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }

        if (bindingResult.hasErrors()) {
            theModel.addAttribute("order", order);
            
            if (order.getId() != null) {
                List<OrderProduct> orderProducts = orderProductService.findByOrderId(order.getId());
                theModel.addAttribute("orderProducts", orderProducts);
                theModel.addAttribute("productsMap", productService.asMap());
            }
            return "pages/orders/edit";
        } else {
            return "redirect:/orders/list";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") Long id) throws ResourceNotFoundException {
        orderService.delete(id);
        return "redirect:/orders/list";
    }
}
