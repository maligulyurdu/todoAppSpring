package com.todolist.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("name")
public class WelcomeController {

    Logger logger = LoggerFactory.getLogger(getClass());
    @GetMapping("/")
    public String goToLWelcomePage(ModelMap model) {
        model.put("name",getLoggedInUsername());
        logger.warn("GIRIS YAPAN: {}",getLoggedInUsername());
        return "welcome"; //
        // login.jsp

    }

    private String getLoggedInUsername(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        return authentication.getName();
    }

}
