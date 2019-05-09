package com.pizzahouse.controller;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Address;
import com.pizzahouse.model.User;
import com.pizzahouse.model.UserRole;
import com.pizzahouse.service.AddressService;
import com.pizzahouse.service.UserManagementService;
import com.pizzahouse.service.UserRoleService;
import com.pizzahouse.service.UserService;
import java.security.Principal;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author stargazer
 */
@Controller
public class AccountController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserManagementService userManagementService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private UserRoleService userRoleService;

    @RequestMapping(value = "/userAccount", method = RequestMethod.GET)
    public String edit(Model theModel, Principal principal) {
        if (principal == null) {
            return "redirect:/login";
        }
        User user = userService.findByUsername(principal.getName());

        theModel.addAttribute("user", user);
        theModel.addAttribute("addresses", addressService.findByUserId(user.getId()));

        return "pages/account/userAccount";
    }

    @RequestMapping(value = "/accountUpdate", method = RequestMethod.POST)
    public String update(Model theModel, @ModelAttribute("user") @Valid User user, BindingResult bindingResult) {

        if (user.getId() != null) {
            try {
                user = userManagementService.save(user);
            } catch (Exception exc) {
                System.out.println(exc.getMessage());
            }
        }

        if (bindingResult.hasErrors()) {
            theModel.addAttribute("user", user);

            return "pages/account/userAccount";
        } else {
            return "redirect:/userAccount";
        }
    }

    @RequestMapping(value = "/addressEdit", method = RequestMethod.GET)
    public String edit(Model theModel, Principal principal, @RequestParam(name = "id", required = false) Long id) {
        if (principal == null) {
            return "redirect:/login";
        }
        User user = userService.findByUsername(principal.getName());

        if (id == null) {
            Address address = new Address();
            address.setUserId(user.getId());
            theModel.addAttribute("address", address);
        } else {
            Address address = addressService.find(id);
            theModel.addAttribute("address", address);
        }
        return "pages/account/addressEdit";
    }

    @RequestMapping(value = "/addressUpdate", method = RequestMethod.POST)
    public String save(Model theModel, Principal principal, @ModelAttribute("address") @Valid Address address, BindingResult bindingResult) {
        if (principal == null) {
            return "redirect:/login";
        }
        User user = userService.findByUsername(principal.getName());

        try {
            if (address.getUserId().equals(user.getId())) {
                address = addressService.save(address);
            }

        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }

        if (bindingResult.hasErrors()) {
            theModel.addAttribute("address", address);

            return "pages/account/addressEdit";
        } else {
            return "redirect:/userAccount";
        }
    }

    @RequestMapping(value = "/addressDelete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") Long id, Principal principal) throws ResourceNotFoundException {
        if (principal == null) {
            return "redirect:/login";
        }
        User user = userService.findByUsername(principal.getName());

        Address address = addressService.find(id);

        if (address.getUserId().equals(user.getId())) {
            addressService.delete(id);
        }
        return "redirect:/userAccount";
    }
}