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
import com.tsguild.lvl2.dto.StaticPage;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    @RequestMapping(value = "/pages", method = RequestMethod.GET)
    public List<StaticPage> getAllStaticPages() {
        return staticDao.getAllStaticPages();
    }

    @ResponseBody
    @RequestMapping(value = "/post/{postId}", method = RequestMethod.GET)
    public BlogPost getJsonPost(@PathVariable int postId) {
        return blogDao.getBlogPostById(postId);
    }

    @ResponseBody
    @RequestMapping(value = "/page/{pageId}", method = RequestMethod.GET)
    public StaticPage getJsonPage(@PathVariable int pageId) {
        return staticDao.getStaticPageById(pageId);
    }

    @ResponseBody
    @RequestMapping(value = "/tags/{tagID}", method = RequestMethod.GET)
    public List<BlogPost> searchPostsByTagID(@PathVariable int tagID) {
        return blogDao.getBlogPostsByTagID(tagID);
    }
    
    @ResponseBody
    @RequestMapping(value = "/tagName/{tagId}", method = RequestMethod.GET)
    public String searchPostsByTagName(@PathVariable int tagId) {
        return blogDao.getTagNameFromID(tagId);
    }
    
    @ResponseBody
    @RequestMapping(value = "/post/{postId}/tags", method = RequestMethod.GET)
    public List<Integer> extractTagsByPostId(@PathVariable int postId) {
        return blogDao.extractTagsByPostId(postId);
    }

    @ResponseBody
//    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value = "/blog", method = RequestMethod.POST)
    public BlogPost createBlogPost(@RequestBody BlogPost blogPost, HttpServletRequest request) {
        /*
        1 Admin Post
        2 User Post Pending
        3 User Post Approved
        4 User Post Declined
        5 Admin Comment
        6 Reader comment Pending
        7 Reader Comment Approved
        8 Reader Comment Declined
        9 Draft
        10 Pending Deletion
        11 Deleted
         */

        int s = blogPost.getStatus();

        // admin only status
        if (s == -1 || s == 1 || s == 2 || s == 3 || s == 4 || s == 9 || s == 10 || s == 11) {
            if (s == -1 || s == 2) { //if its an unsorted or user post
                if (request.isUserInRole("ROLE_EMPLOYEE")) {
                    blogPost.setStatus(2);
                } else if (request.isUserInRole("ROLE_ADMIN")) {
                    blogPost.setStatus(1);
                }
            } else if (s == 9) { //if its a draft make sure they're authenticated
                if (!(request.isUserInRole("ROLE_EMPLOYEE") || request.isUserInRole("ROLE_ADMIN"))) {
                    return new BlogPost();
                }
            } else if (!request.isUserInRole("ROLE_ADMIN")) {
                return new BlogPost();
            }
        } else {
            return new BlogPost();
        }

        blogPost.setAuthor(request.getUserPrincipal().getName());
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

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(value = "/staticpage/{id}", method = RequestMethod.PUT)
    public void editStaticPage(@RequestBody StaticPage page, HttpServletRequest request) {
        if (request.isUserInRole("ROLE_EMPLOYEE")) {
            page.setStatus(12);
        } else if (request.isUserInRole("ROLE_ADMIN")) {
            page.setStatus(15);
        }
        staticDao.updateStaticPage(page);
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

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(value = "/staticpage/{id}", method = RequestMethod.DELETE)
    public void deleteStaticPage(@PathVariable int id, HttpServletRequest request) {
        StaticPage page = staticDao.getStaticPageById(id);
        if (request.isUserInRole("ROLE_EMPLOYEE")) {
            page.setStatus(10);
            staticDao.updateStaticPage(page);
        } else if (request.isUserInRole("ROLE_ADMIN")) {
            staticDao.removeStaticPage(id);
        }
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value = "/staticpage", method = RequestMethod.POST)
    public void createStaticPage(@RequestBody StaticPage page, HttpServletRequest request) {

        if (request.isUserInRole("ROLE_EMPLOYEE")) {
            page.setStatus(12);
        } else if (request.isUserInRole("ROLE_ADMIN")) {
            page.setStatus(15);
        }

        staticDao.addStaticPage(page);
    }
}
