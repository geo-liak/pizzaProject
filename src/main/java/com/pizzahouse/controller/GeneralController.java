package com.pizzahouse.controller;

import javax.servlet.http.HttpServletResponse;
import com.pizzahouse.model.User;
import com.pizzahouse.model.UserRole;
import com.pizzahouse.service.SecurityService;
import com.pizzahouse.service.UserRoleService;
import com.pizzahouse.service.UserService;
import com.pizzahouse.validator.UserValidator;
import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GeneralController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = {"/", "home"}, method = RequestMethod.GET)
    public String home(HttpServletResponse response, Principal principal, Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Your username and password is invalid.");
        }

        if (logout != null) {
            model.addAttribute("message", "You have been logged out successfully.");
        }

        if (principal != null) {
            User user = userService.findByUsername(principal.getName());
            Long userId = user.getId();
            List<UserRole> userRoles = userRoleService.findByUserId(userId);
            for (UserRole userRole : userRoles) {

                if (userRole.getRoleId() == 1 || userRole.getRoleId() == 2) {
                    model.addAttribute("privileges", true);
                    return "redirect:/orders/list?progress=1";
                } else if (userRole.getRoleId() == 3) {
                    model.addAttribute("privileges", false);
                    return "redirect:/menu";
                } else {
//            response.addCookie(new Cookie("sum", "0"));
                    model.addAttribute("privileges", false);
                    return "/home";
                }
            }
        }
        return "/home";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "pages/registration";
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

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contact(Model model) {
        return "pages/contact";
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

}
