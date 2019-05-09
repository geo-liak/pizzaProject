package com.pizzahouse.controller;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.User;
import com.pizzahouse.model.UserRole;
import com.pizzahouse.model.specifications.UserManagementSpecification;
import com.pizzahouse.service.AddressService;
import com.pizzahouse.service.RoleService;
//import com.pizzahouse.repository.UserRoleRepository;
import com.pizzahouse.service.UserManagementService;
import com.pizzahouse.service.UserRoleService;
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
import org.springframework.security.crypto.password.PasswordEncoder;

@Controller
@RequestMapping(value = "/users")
public class UserManagementController extends AbstractController {

    @Autowired
    private UserManagementService userManagementService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model,
            @RequestParam(value = "query", required = false, defaultValue = "") String query,
            @RequestParam(value = "role", required = false, defaultValue = "customers") String role) {

        List<User> users = null;

        if (query != null && query.trim().length() > 0) {
            users = userManagementService.findAll(Specifications.where(UserManagementSpecification.containsText(query)));
        } else {
            users = userManagementService.findAll();
        }

        // Retrieve userRoles according to requested role
        List<UserRole> userRoles = null;
        if ("employees".equals(role)) {
            // ROLE_ADMIN + ROLE_EMPLOYEE
            userRoles = userRoleService.findByRoleId(1L);
            userRoles.addAll(userRoleService.findByRoleId(2L));
        } else if ("customers".equals(role)) {
            // ROLE_CUSTOMER
            userRoles = userRoleService.findByRoleId(3L);
        }

        List<User> filteredUsers = new ArrayList();
        for (User user : users) {
            for (UserRole userRole : userRoles) {
                // if our user is found in the userRoles, keep them
                if (user.getId().equals(userRole.getUserId())) {
                    filteredUsers.add(user);
                    break;
                }
            }
        }

        model.addAttribute("users", filteredUsers);
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
        theModel.addAttribute("userRoles", userRoleService.findByUserId(id));
        theModel.addAttribute("rolesMap", roleService.asMap());
        theModel.addAttribute("addresses", addressService.findByUserId(id));

        return "pages/users/edit";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String save(Model theModel, @ModelAttribute("user") @Valid User user, BindingResult bindingResult,
            @RequestParam(value = "role", required = false, defaultValue = "customers") String role) {

        if (user.getId() != null) {
            try {
                user = userManagementService.save(user);
            } catch (Exception exc) {
                System.out.println(exc.getMessage());
            }
        } else {
            try {
                user = userManagementService.saveNew(user, role);
                user.setPassword(passwordEncoder.encode("test"));
            } catch (Exception exc) {
                System.out.println(exc.getMessage());
            }
        }

        if (bindingResult.hasErrors()) {
            theModel.addAttribute("user", user);

            return "pages/users/edit";
        } else {
            return "redirect:/users/list?role=" + role;
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") Long id,
            @RequestParam(value = "role", required = false, defaultValue = "customers") String role) throws ResourceNotFoundException {
        userManagementService.delete(id);
        return "redirect:/users/list?role="+role;
    }

    @RequestMapping(value = "/customers", method = RequestMethod.GET)
    public String customers(Model theModel) {
        List<User> customers = null;

        try {
            List<UserRole> listOfCustomers = userRoleService.findByRoleId(3L);
            for (UserRole userRole : listOfCustomers) {
                Long userId = userRole.getId();
                customers.add(userManagementService.find(userId));
            }
        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }

        theModel.addAttribute("users", customers);
        return "pages/users/list";

    }

    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    public String employees(Model theModel) {
        List<User> employees = null;

        try {
            List<UserRole> listOfEmployees = userRoleService.findAll();
            for (UserRole userRole : listOfEmployees) {
                if (userRole.getId() != 3L) {
                    Long userId = userRole.getId();
                    employees.add(userManagementService.find(userId));
                }
            }
        } catch (NullPointerException exc) {
            System.out.println(exc.getMessage());
        }

        theModel.addAttribute("users", employees);
        return "pages/users/list";

    }
}
