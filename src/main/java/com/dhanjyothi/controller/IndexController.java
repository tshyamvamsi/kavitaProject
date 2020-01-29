package com.dhanjyothi.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class IndexController {
 

    @RequestMapping("/about")
    public String about(Map<String, Object> model) {
        model.put("message", "Welcome to DhanJoyti Bank");
        return "about";
    }
    
    @RequestMapping("/contact")
    public String contact(Map<String, Object> model) {
        model.put("message", "Please contact DhanJoyti Bank Ph: +91-900-000-0000");
        return "contact";
    }
    
    @RequestMapping("/home")
    public String home(Map<String, Object> model) {
        model.put("message", "This is the welcome Page");
        return "home";
    }
    
    @RequestMapping("/chequebook")
    public String chequebook(Map<String, Object> model) {
        model.put("message", "This is age of Cheque Book request");
        return "chequebook";
    }
    
    @RequestMapping("/errorlogin")
    public String errorlogin(Map<String, Object> model) {
        model.put("message", "Please enter correct login");
        return "errorlogin";
    }
    
    @RequestMapping("/erroraddingtransferaccount")
    public String erroraddingtransferaccount(Map<String, Object> model) {
        model.put("message", "Please add right account number");
        return "erroraddingtransferaccount";
    }
 
}