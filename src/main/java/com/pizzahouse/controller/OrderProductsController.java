package com.pizzahouse.controller;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.OrderProduct;
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
import com.pizzahouse.service.ProductService;
import org.springframework.web.bind.annotation.PathVariable;
import com.pizzahouse.service.OrderProductService;

@Controller
@RequestMapping(value = "/orderproducts")
public class OrderProductsController extends AbstractController {

    @Autowired
    private OrderProductService orderProductService;
    
    @Autowired
    private ProductService productService;


    @RequestMapping(value = "/{order}/edit", method = RequestMethod.GET)
    public String edit(Model theModel, @PathVariable Long order, @RequestParam(name = "id", required = false) Long id) {
        if (id == null) {
            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setOrderId(order);
            theModel.addAttribute("orderProduct", orderProduct);
        } else {
            OrderProduct orderProduct = orderProductService.find(id);
            theModel.addAttribute("orderProduct", orderProduct);
        }
        theModel.addAttribute("products", productService.findAll());
        return "pages/orderProducts/edit";
    }

    @RequestMapping(value = "/{order}/update", method = RequestMethod.POST)
    public String save(Model theModel, @PathVariable Long order, @ModelAttribute("orderProduct") @Valid OrderProduct orderProduct, BindingResult bindingResult) {

        List<String> errors = new ArrayList<>();
        try {
            OrderProduct existing = orderProductService.findByOrderIdAndProductId(order, orderProduct.getProductId());
            if (orderProduct.getId() != null || existing == null) {
                orderProduct = orderProductService.save(orderProduct);
            } else {
                existing.setQuantity(existing.getQuantity() + orderProduct.getQuantity());
                orderProduct = orderProductService.save(existing);
            }
        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }

        if (bindingResult.hasErrors()) {
            theModel.addAttribute("orderProduct", orderProduct);
            theModel.addAttribute("products", productService.findAll());

            return "pages/orderProducts/edit";
        } else {
            return "redirect:/orders/edit?id="+order;
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") Long id) throws ResourceNotFoundException {
        OrderProduct orderProduct = orderProductService.find(id);
        orderProductService.delete(id);
        return "redirect:/orders/edit?id="+orderProduct.getOrderId();
    }
}
