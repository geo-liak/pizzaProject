package com.pizzahouse.controller;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.UserRole;
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
import com.pizzahouse.service.RoleService;
import org.springframework.web.bind.annotation.PathVariable;
import com.pizzahouse.service.UserRoleService;

@Controller
@RequestMapping(value = "/userroles")
public class UserRoleController extends AbstractController {

    @Autowired
    private UserRoleService userRoleService;
    
    @Autowired
    private RoleService roleService;


    @RequestMapping(value = "/{user}/edit", method = RequestMethod.GET)
    public String edit(Model theModel, @PathVariable Long user, @RequestParam(name = "id", required = false) Long id) {
        if (id == null) {
            UserRole userRole = new UserRole();
            userRole.setUserId(user);
            theModel.addAttribute("userRole", userRole);
        } else {
            UserRole userRole = userRoleService.find(id);
            theModel.addAttribute("userRole", userRole);
        }
        theModel.addAttribute("roles", roleService.findAll());
        return "pages/userRoles/edit";
    }

    @RequestMapping(value = "/{user}/update", method = RequestMethod.POST)
    public String save(Model theModel, @PathVariable Long user, @ModelAttribute("userRole") @Valid UserRole userRole, BindingResult bindingResult) {

        List<String> errors = new ArrayList<>();
        try {
            UserRole existing = userRoleService.findByUserIdAndRoleId(user, userRole.getRoleId());
            if (existing == null) {
                userRole = userRoleService.save(userRole);
            }
        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }

        if (bindingResult.hasErrors()) {
            theModel.addAttribute("userRole", userRole);
            theModel.addAttribute("roles", roleService.findAll());

            return "pages/userRoles/edit";
        } else {
            return "redirect:/users/edit?id="+user;
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") Long id) throws ResourceNotFoundException {
        UserRole userRole = userRoleService.find(id);
        userRoleService.delete(id);
        return "redirect:/users/edit?id="+userRole.getUserId();
    }
}
