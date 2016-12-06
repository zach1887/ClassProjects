package com.tsguild.lvl2;

import com.tsguild.lvl2.dao.BlogPostDao;
import com.tsguild.lvl2.dto.BlogPost;
import com.tsguild.lvl2.dto.Comment;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping(value = "/blogWithComments/{postId}", method = RequestMethod.GET)
    public String displayBlogWithComments(ModelMap model, @PathVariable int postId) {
        BlogPost post = dao.getBlogPostById(postId);

        model.addAttribute("title", post.getTitle());
        model.addAttribute("author", post.getAuthor());
        model.addAttribute("datePosted", post.getDatePosted());
        model.addAttribute("content", post.getContent());
        model.addAttribute("id", post.getId());

        return "template/blogWithComments";

    }
    
    @ResponseBody
    @RequestMapping(value="/blogWithComments/comments/{postId}", method = RequestMethod.GET)
    public List<Comment> loadCommentsByPostId(@PathVariable int postId) {
        return dao.loadCommentsByBlogId(postId);
    }
    
    
    @ResponseBody
    @RequestMapping(value = "/blogWithComments/comment", method = RequestMethod.POST)
    public Comment createComment(@RequestBody Comment comment) {
        return dao.createComment(comment);
    }

    @RequestMapping(value = "/comment/approve", method = RequestMethod.PUT)
    public void approveComment(int commentId) {
        dao.approveComment(commentId);
    }

    @RequestMapping(value = "/comment/decline", method = RequestMethod.POST)
    public void declineComment(int commentId) {
        dao.declineComment(commentId);
    }

    @RequestMapping(value = "/comment/{commentId}", method = RequestMethod.DELETE)
    public void deleteComment(@PathVariable int commentId) {
        dao.deleteComment(commentId);
    }
}
