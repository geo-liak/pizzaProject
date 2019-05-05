package com.pizzahouse.controller;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.User;
import com.pizzahouse.model.specifications.UserManagementSpecification;
import com.pizzahouse.service.UserManagementService;
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

@Controller
@RequestMapping(value = "/users")
public class UserManagementController extends AbstractController {

    @Autowired
    private UserManagementService userManagementService;


    @RequestMapping(value = "/menu", method = RequestMethod.GET)
    public String usersMenu(Model model) {
        model.addAttribute("users", userManagementService.findAll());
        return "pages/menu";
    }


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model,
			@RequestParam(value = "query", required = false, defaultValue = "") String query) {

        if (query != null && query.trim().length() > 0) {
            model.addAttribute("users", userManagementService.findAll(Specifications.where(UserManagementSpecification.containsText(query))));
        } else {
            model.addAttribute("users", userManagementService.findAll());
        }

        return "pages/users/list";
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Model theModel, @RequestParam(name = "id", required = false) Long id) {
        if (id == null) {
            theModel.addAttribute("user", new User());
        } else {
            User user = userManagementService.find(id);
            theModel.addAttribute("user", user);
        }
        return "pages/users/edit";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String save(Model theModel, @ModelAttribute("user") @Valid User user, BindingResult bindingResult) {

        List<String> errors = new ArrayList<>();
        try {
            user = userManagementService.save(user);
        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }

        if (bindingResult.hasErrors()) {
            theModel.addAttribute("user", user);

            return "pages/users/edit";
        } else {
            return "redirect:/users/list";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") Long id) throws ResourceNotFoundException {
        userManagementService.delete(id);
        return "redirect:/users/list";
    }
}
