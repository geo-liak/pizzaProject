package com.pizzahouse.controller;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Address;
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
import org.springframework.web.bind.annotation.PathVariable;
import com.pizzahouse.service.AddressService;

@Controller
@RequestMapping(value = "/address")
public class AddressController extends AbstractController {

    @Autowired
    private AddressService addressService;


    @RequestMapping(value = "/{user}/edit", method = RequestMethod.GET)
    public String edit(Model theModel, @PathVariable Long user, @RequestParam(name = "id", required = false) Long id) {
        if (id == null) {
            Address address = new Address();
            address.setUserId(user);
            theModel.addAttribute("address", address);
        } else {
            Address address = addressService.find(id);
            theModel.addAttribute("address", address);
        }
        return "pages/addresses/edit";
    }

    @RequestMapping(value = "/{user}/update", method = RequestMethod.POST)
    public String save(Model theModel, @PathVariable Long user, @ModelAttribute("address") @Valid Address address, BindingResult bindingResult) {

        List<String> errors = new ArrayList<>();
        try {
//            Address existing = addressService.findByUserIdAndAddressId(user, address.getAddressId());
//            if (existing == null) {
                address = addressService.save(address);
//            }
        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }

        if (bindingResult.hasErrors()) {
            theModel.addAttribute("address", address);

            return "pages/addresses/edit";
        } else {
            return "redirect:/users/edit?id="+user;
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") Long id) throws ResourceNotFoundException {
        Address address = addressService.find(id);
        addressService.delete(id);
        return "redirect:/users/edit?id="+address.getUserId();
    }
}
