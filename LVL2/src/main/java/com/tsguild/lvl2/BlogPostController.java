
package com.tsguild.lvl2;

import com.tsguild.lvl2.dao.BlogPostDao;
import com.tsguild.lvl2.dto.BlogPost;
import com.tsguild.lvl2.dto.Comment;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Morgan Smith
 */
@Controller
public class BlogPostController {

    private final BlogPostDao dao;

    @Inject
    public BlogPostController(BlogPostDao dao) {
        this.dao = dao;
    }
    
    @RequestMapping(value = "/blog/{id}", method = RequestMethod.GET)
    public String displayBlog(ModelMap model, @PathVariable("id") int id) {
        BlogPost post = dao.getBlogPostById(id);
        
        model.addAttribute("title", post.getTitle());
        model.addAttribute("author", post.getAuthor());
        model.addAttribute("datePosted", post.getDatePosted());
        model.addAttribute("content", post.getContent());
        
        return "template/blog";
    }
    
    public String displayBlogComments(int id) {
        throw new UnsupportedOperationException("nope");
    }
    
    public void createComment(Comment comment, int id) {
        throw new UnsupportedOperationException("nope");
    }
}
