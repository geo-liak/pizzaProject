package com.pizzahouse.controller;

import com.pizzahouse.chat.Message;
import com.pizzahouse.chat.OutputMessage;
import com.pizzahouse.model.User;
import com.pizzahouse.model.UserRole;
import com.pizzahouse.service.AddressService;
import com.pizzahouse.service.UserManagementService;
import com.pizzahouse.service.UserRoleService;
import com.pizzahouse.service.UserService;
import java.security.Principal;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class ChatController extends AbstractController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;
    
    
    @RequestMapping(value = "/messages", method = RequestMethod.GET)
    public String chatPage(Principal principal, Model theModel) {
        
        if (principal == null) {
            return "redirect:/login";
        }
        User user = userService.findByUsername(principal.getName());
        
        List<UserRole> userRoles = userRoleService.findByUserId(user.getId());
        boolean hasPrivileges = checkPrivileges(user.getId(), userRoles);
        theModel.addAttribute("privileges", hasPrivileges);
        
        return "pages/helpdesk";
    }


    @MessageMapping("/chat")
    @SendTo("/topic/messages")
    public OutputMessage send(Message message) throws Exception {
        String time = new SimpleDateFormat("HH:mm").format(new Date());
        return new OutputMessage(message.getFrom(), message.getText(), time);
    }


}
