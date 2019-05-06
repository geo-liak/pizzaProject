package com.pizzahouse.controller;

import com.pizzahouse.model.Order;
import com.pizzahouse.model.OrderProduct;
import com.pizzahouse.model.Product;
import com.pizzahouse.model.User;
import com.pizzahouse.service.OrderProductService;
import com.pizzahouse.service.OrderService;
import com.pizzahouse.service.ProductService;
import com.pizzahouse.service.UserService;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CurrentOrderController {

    @Autowired
    private UserService userService;
    
   
    @Autowired
    private OrderService orderService;
    
    @Autowired
    private OrderProductService orderProductService;


    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/menu", method = RequestMethod.GET)
    public String menu(Principal principal, Model model) {
        
        try {
            User user = userService.findByUsername(principal.getName());
            Order order = orderService.findOrCreateCurrentOrder(user.getId());
            List<OrderProduct> orderProducts = orderProductService.findByOrderId(order.getId());
            List<Product> products = productService.findAll();
            
            // map with key=product.id and value=OrderProduct
            Map<Long, OrderProduct> orderProductMap = new HashMap<>();
            for (Product product: products) {
                orderProductMap.put(product.getId(), new OrderProduct(product.getId(), 0L, order.getId()));
            }
            for (OrderProduct orderProduct: orderProducts) {
                orderProductMap.put(orderProduct.getProductId(), orderProduct);
            }
            model.addAttribute("hello", "hello");
            model.addAttribute("products", products);
            model.addAttribute("orderProductMap", orderProductMap);

        } catch(Exception e) {
            System.out.println("Exception thrown in menu: " + e);
            e.printStackTrace();
        }
        return "pages/menu";
    }
    
    

    @RequestMapping(value = "/addToCart", method = RequestMethod.POST)
    public String save(Model theModel,
            @RequestParam(name="id", required = false) Long id,
            @RequestParam(name="productId", required = false) Long productId,
            @RequestParam(name="quantity", required = false) Long quantity,
            @RequestParam(name="orderId", required = false) Long orderId,
            Principal principal) {

        OrderProduct orderProduct = new OrderProduct(id, productId, quantity, orderId);
        System.out.println("ADD TO CART: "+orderProduct);
        try {
            User user = userService.findByUsername(principal.getName());
            Order order = orderService.findOrCreateCurrentOrder(user.getId());
            
            // permit only if the submitted order product has correct order id AND quanity > 0
            if (orderProduct.getOrderId().equals(order.getId()) && quantity > 0L) {
                orderProduct = orderProductService.save(orderProduct);
            }
        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }

        return "redirect:/menu";
    }
    

    @RequestMapping(value = "/review", method = RequestMethod.GET)
    public String review(Model model) {
        model.addAttribute("menuItems", productService.findAll());
        return "pages/review";
    }


}
