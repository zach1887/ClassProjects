/*
 * Copyright (c) 2016, Dan Whitlow
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
package com.tsguild.lvl2;

import com.tsguild.lvl2.dao.BlogPostDao;
import com.tsguild.lvl2.dao.StaticPageDao;
import com.tsguild.lvl2.dto.BlogPost;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author Dan Whitlow
 */
@Controller
public class AdminController {

    private final StaticPageDao staticDao;
    private final BlogPostDao blogDao;

    @Inject
    public AdminController(StaticPageDao staticDao, BlogPostDao blogDao) {
        this.staticDao = staticDao;
        this.blogDao = blogDao;
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {
        
        return "admin";
    }

    @ResponseBody
    @RequestMapping(value = "/posts", method = RequestMethod.GET)
    public List<BlogPost> getAllBlogPosts() {
        return blogDao.getAllBlogPosts();
    }

    @ResponseBody
//    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value = "/blog", method = RequestMethod.POST)
    public BlogPost createBlogPost(@RequestBody BlogPost blogPost, HttpServletRequest request) {
        if (request.isUserInRole("ROLE_EMPLOYEE")) {
            blogPost.setStatus(2);
        } else if (request.isUserInRole("ROLE_ADMIN")) {
            blogPost.setStatus(1);
        }

        blogPost.setAuthor(request.getUserPrincipal().getName());
        return blogDao.addBlogPost(blogPost);
    }
    
    @ResponseBody
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value="/blog", method=RequestMethod.PUT)
    public BlogPost draftBlogPost(@RequestBody BlogPost blogPost){
        blogPost.setStatus(9);
        return blogDao.addBlogPost(blogPost);
    }
    
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public void editBlogPost(@RequestBody BlogPost editedPost, HttpServletRequest request) {
        if (request.isUserInRole("ROLE_EMPLOYEE")) {
            editedPost.setStatus(2);
        } else if (request.isUserInRole("ROLE_ADMIN")) {
            editedPost.setStatus(1);
        }
        blogDao.updateBlogPost(editedPost);
    }

    // this isnt the real edit page just using it for testing
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editBlogPost(ModelMap model, @PathVariable int id) {
        BlogPost postToEdit = blogDao.getBlogPostById(id);

        model.addAttribute("title", postToEdit.getTitle());
        model.addAttribute("author", postToEdit.getAuthor());
        model.addAttribute("datePosted", postToEdit.getDatePosted());
        model.addAttribute("content", postToEdit.getContent());
        model.addAttribute("status", postToEdit.getStatus());
        model.addAttribute("id", postToEdit.getId());

        return "edit";
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(value = "/blog/{id}", method = RequestMethod.DELETE)
    public void deleteBlogPost(@PathVariable int id, HttpServletRequest request) {
        BlogPost post = blogDao.getBlogPostById(id);
        if (request.isUserInRole("ROLE_EMPLOYEE")) {
            post.setStatus(10);
            blogDao.updateBlogPost(post);
        } else if (request.isUserInRole("ROLE_ADMIN")) {
            blogDao.removeBlogPost(id);
        }
    }
}
