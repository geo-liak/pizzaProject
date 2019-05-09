package com.pizzahouse.controller;

import com.pizzahouse.exceptions.ResourceNotFoundException;
import com.pizzahouse.model.Card;
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
import com.pizzahouse.service.CardService;

@Controller
@RequestMapping(value = "/card")
public class CardController extends AbstractController {

      @Autowired
    private CardService cardService;
    
    
       @RequestMapping(value = "/{user}/edit", method = RequestMethod.GET)
    public String edit(Model theModel, @PathVariable Long user, @RequestParam(name = "id", required = false) Long id) {
        if (id == null) {
            Card card = new Card();
            card.setUserId(user);
            theModel.addAttribute("card", card);
        } else {
            Card card = cardService.find(id);
            theModel.addAttribute("card", card);
        }
        return "pages/cards/edit";
    }
      
      
    @RequestMapping(value = "/{user}/update", method = RequestMethod.POST)
    public String save(Model theModel, @PathVariable Long user, @ModelAttribute("card") @Valid Card card, BindingResult bindingResult) {
        
        try {
            card = cardService.save(card);

        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }

        if (bindingResult.hasErrors()) {
            theModel.addAttribute("card", card);

            return "pages/cards/edit";
        } else {
            return "redirect:/users/edit?id="+user;
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") Long id) throws ResourceNotFoundException {
        Card card = cardService.find(id);
        cardService.delete(id);
        return "redirect:/users/edit?id=" + card.getUserId();
    }
    
    
}
