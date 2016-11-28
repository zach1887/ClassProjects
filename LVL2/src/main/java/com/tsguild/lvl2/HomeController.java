package com.tsguild.lvl2;

import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
        
    public HomeController() {
    }
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String displayHomeBlog(Map<String, Object> model) {
        return "index";
    }
    
    @RequestMapping(value="/about", method=RequestMethod.GET)
    public String about(Map<String, Object> model) {
        return "about";
    }
    
    @RequestMapping(value="/admin", method=RequestMethod.GET)
    public String admin(Map<String, Object> model) {
        return "admin";
    }
    

    
}
