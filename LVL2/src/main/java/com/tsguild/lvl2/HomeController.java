package com.tsguild.lvl2;

import com.tsguild.lvl2.dao.BlogPostDao;
import com.tsguild.lvl2.dto.BlogPost;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
    
    private BlogPostDao dao;
    
    @Inject
    public HomeController(BlogPostDao dao) {
        this.dao = dao;
    }
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String displayHomeBlog(Map<String, Object> model) {
        return "index";
    }
    
    @RequestMapping(value="/about", method=RequestMethod.GET)
    public String about(Map<String, Object> model) {
        return "about";
    }
    
    @RequestMapping(value="/author/{author}", method=RequestMethod.GET)
    public String displayPostsByAuthor(Model model, @PathVariable String author) {
        
        List<BlogPost> posts = dao.getBlogPostsByAuthor(author);
        model.addAttribute("authorPosts", posts);
        
        return "template/authors";
    }
    
}
