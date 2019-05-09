package com.pizzahouse.controller;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Order;
import com.pizzahouse.model.OrderProduct;
import com.pizzahouse.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.pizzahouse.service.OrderProductService;
import com.pizzahouse.service.UserManagementService;

@Controller
@RequestMapping(value = "/orders")
public class OrderController extends AbstractController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderProductService orderProductService;
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private AddressService addressService;
    
    @Autowired
    private UserManagementService userManagementService;

    
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model,
            @RequestParam(name = "progress", required = false, defaultValue = "1") Integer progress) {

        if (progress == null) {
            model.addAttribute("orders", orderService.findAll());
        } else {
            model.addAttribute("orders", orderService.findByProgress(progress));
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
            theModel.addAttribute("addresses", addressService.findByUserId(order.getUserId()));
            theModel.addAttribute("users", userManagementService.findAll());
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
                theModel.addAttribute("addresses", addressService.findByUserId(order.getUserId()));
                theModel.addAttribute("users",userManagementService.findAll());
            }
            return "pages/orders/edit";
        } else {
            return "redirect:/orders/list?progress="+order.getProgress();
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") Long id) throws ResourceNotFoundException {
        orderService.delete(id);
        return "redirect:/orders/list";
    }
    
}
