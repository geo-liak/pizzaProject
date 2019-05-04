package com.pizzahouse.controller;

import com.pizzahouse.model.User;
import com.pizzahouse.service.SecurityService;
import com.pizzahouse.service.UserService;
import com.pizzahouse.validator.UserValidator;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "pages/registration";
    }
    
      @RequestMapping(value = "/menu", method = RequestMethod.GET)
    public String menu(Model model) {
        return "pages/menu";
    }
   
       @RequestMapping(value = "/review", method = RequestMethod.GET)
    public String review(Model model) {
        return "pages/review";
    }
    
      @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contact(Model model) {
        return "pages/contact";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "/pages/registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Your username and password is invalid.");
        }

        if (logout != null) {
            model.addAttribute("message", "You have been logged out successfully.");
        }

        return "/pages/login";
    }

    @RequestMapping(value = {"/","home"} , method = RequestMethod.GET)
    public String home(Principal principal, Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Your username and password is invalid.");
        }

        if (logout != null) {
            model.addAttribute("message", "You have been logged out successfully.");
        }

        if (principal != null) {
            return "/pages/welcome";
        } else {
            return "/home";
        }
        
    }

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String welcome(Model model) {
        return "/pages/welcome";
    }
}
