package com.tsguild.lvl2;

import com.tsguild.lvl2.dao.BlogPostDao;
import com.tsguild.lvl2.dao.StaticPageDao;
import com.tsguild.lvl2.dto.BlogPost;
import com.tsguild.lvl2.dto.StaticPage;
import java.util.ArrayList;
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
    private StaticPageDao staticDao;
    
    @Inject
    public HomeController(BlogPostDao dao, StaticPageDao staticDao) {
        this.dao = dao;
        this.staticDao = staticDao;
    }
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String displayHomeBlog(Model model) {
        List<BlogPost> recentPosts = dao.getRecentPosts();
        ArrayList<Integer> postCommentNumbers = new ArrayList<>();
        for (BlogPost post : recentPosts) {
            postCommentNumbers.add(dao.countCommentsById(post.getId()));
        }
        
        model.addAttribute("recentPosts", recentPosts);
        model.addAttribute("commentNumber", postCommentNumbers);
        return "index";
    }
    
    @RequestMapping(value="/about", method=RequestMethod.GET)
    public String about(Map<String, Object> model) {
        return "about";
    }
    
    @RequestMapping(value="/author/{author}", method=RequestMethod.GET)
    public String displayPostsByAuthor(Model model, @PathVariable String author) {
        
        List<BlogPost> posts = dao.getBlogPostsByAuthor(author);
        ArrayList<Integer> postCommentNumbers = new ArrayList<>();
        for (BlogPost post : posts) {
            postCommentNumbers.add(dao.countCommentsById(post.getId()));
        }
        
        
        model.addAttribute("authorPosts", posts);
        model.addAttribute("commentNumber", postCommentNumbers);
        
        return "template/authors";
    }
    
}
