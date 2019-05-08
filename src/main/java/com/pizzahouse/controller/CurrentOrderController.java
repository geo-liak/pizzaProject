package com.pizzahouse.controller;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Address;
import com.pizzahouse.model.Order;
import com.pizzahouse.model.OrderProduct;
import com.pizzahouse.model.Product;
import com.pizzahouse.model.User;
import com.pizzahouse.service.AddressService;
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
import com.pizzahouse.service.OrderProductService;
import java.util.ArrayList;
import java.util.Date;
import javax.validation.Valid;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;

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

    @Autowired
    private AddressService addressService;

    @RequestMapping(value = "/menu", method = RequestMethod.GET)
    public String menu(Principal principal, Model model) {
        List<OrderProduct> orderProducts = new ArrayList();
        Long orderId = 0L;
        try {
            if (principal != null) {
                User user = userService.findByUsername(principal.getName());
                Order order = orderService.findOrCreateCurrentOrder(user.getId());
                orderProducts = orderProductService.findByOrderId(order.getId());
                orderId = order.getId();
            }
            List<Product> products = productService.findAll();

            // map with key=product.id and value=OrderProduct
            Map<Long, OrderProduct> orderProductMap = new HashMap<>();
            for (Product product : products) {
                orderProductMap.put(product.getId(), new OrderProduct(product.getId(), 0L, orderId));
            }
            for (OrderProduct orderProduct : orderProducts) {
                orderProductMap.put(orderProduct.getProductId(), orderProduct);
            }
            model.addAttribute("products", products);
            model.addAttribute("orderProductMap", orderProductMap);

        } catch (Exception e) {
            System.out.println("Exception thrown in menu: " + e);
            e.printStackTrace();
        }
        return "pages/menu";
    }

    @RequestMapping(value = "/addToCart", method = RequestMethod.POST)
    public String save(Model theModel,
            @RequestParam(name = "id", required = false) Long id,
            @RequestParam(name = "productId", required = false) Long productId,
            @RequestParam(name = "quantity", required = false) Long quantity,
            @RequestParam(name = "orderId", required = false) Long orderId,
            Principal principal) {

        if (principal == null) {
            return "redirect:/login";
        }

        OrderProduct orderProduct = new OrderProduct(id, productId, quantity, orderId);
        System.out.println("ADD TO CART: " + orderProduct);
        try {
            User user = userService.findByUsername(principal.getName());
            Order order = orderService.findOrCreateCurrentOrder(user.getId());

            // permit only if the submitted order product has correct order id AND quanity > 0
            if (orderProduct.getOrderId().equals(order.getId()) && quantity > 0L) {
                orderProduct = orderProductService.save(orderProduct);
            }
            // delete orderProduct if quantity == 0
            if (orderProduct.getOrderId().equals(order.getId()) && quantity == 0L) {
                orderProductService.delete(orderProduct.getId());
            }
        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }

        return "redirect:/menu";
    }

    @RequestMapping(value = "/review", method = RequestMethod.GET)
    public String review(Principal principal, Model model) {
        List<OrderProduct> orderProducts = new ArrayList();
        Map<Long, Product> productsMap = new HashMap<>();
        Long orderId = 0L;
        Double orderPrice = 0.0;
        Order order = null;
        List<Address> addresses = null;

        if (principal == null) {
            return "redirect:/login";
        }

        try {
            if (principal != null) {
                User user = userService.findByUsername(principal.getName());
                order = orderService.findOrCreateCurrentOrder(user.getId());
                orderId = order.getId();
                orderProducts = orderProductService.findByOrderId(orderId);
                productsMap = productService.asMap();

                for (OrderProduct orderProduct : orderProducts) {
                    Product product = productsMap.get(orderProduct.getProductId());
                    orderPrice = orderPrice + (product.getPrice() * orderProduct.getQuantity());
                }
                order.setPrice(orderPrice);
                orderService.save(order);
                addresses = addressService.findByUserId(user.getId());
            }

            model.addAttribute("orderProducts", orderProducts);
            model.addAttribute("productsMap", productsMap);
            model.addAttribute("order", order);
            model.addAttribute("addresses", addresses);

        } catch (Exception e) {
            System.out.println("Exception thrown in menu: " + e);
            e.printStackTrace();
        }
        return "pages/review";
    }

    @RequestMapping(value = "/placeOrder", method = RequestMethod.POST)
    public String placeOrder(Model theModel, @ModelAttribute("order") @Valid Order order, BindingResult bindingResult) throws ResourceNotFoundException {

        List<String> errors = new ArrayList<>();
        try {
            order = orderService.save(order);
        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }
        
        if (order.getAddressId() == null) {
            bindingResult.addError(new FieldError("order", "addressId",  "error"));
            theModel.addAttribute("addressError", "Please provide an address");
        }
        if (order.getPrice()== null || order.getPrice()==0.0) {
            bindingResult.addError(new FieldError("order", "price",  "error"));
            theModel.addAttribute("priceError", "Please add items to order");
        }
        
        if (bindingResult.hasErrors()) {
            

            theModel.addAttribute("order", order);

            if (order.getId() != null) {
                List<OrderProduct> orderProducts = orderProductService.findByOrderId(order.getId());
                theModel.addAttribute("orderProducts", orderProducts);
                theModel.addAttribute("productsMap", productService.asMap());
                theModel.addAttribute("addresses", addressService.findByUserId(order.getUserId()));
            }

            return "pages/review";
        } else {

            order.setProgress(1);
            Date orderDate = new Date();
            order.setOrderDate(orderDate);
            orderService.save(order);

            return "redirect:/success";
        }
    }

    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public String success(Principal principal, Model model) {
        return "pages/success";
    }

}
