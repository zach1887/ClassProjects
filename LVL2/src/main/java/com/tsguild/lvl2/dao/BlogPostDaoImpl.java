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
package com.tsguild.lvl2.dao;

import com.tsguild.lvl2.dto.BlogPost;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Dan Whitlow
 */
public class BlogPostDaoImpl implements BlogPostDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Add blog post
    private static final String SQL_ADD_POST
            = "INSERT INTO Posts (title, author, datePosted, content, status)"
            + " VALUES (?, ?, ?, ?, ?);";
    private static final String SQL_GET_DISPLAY_NAME
            = "SELECT displayname FROM users WHERE username = ?";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public BlogPost addBlogPost(BlogPost blogPost) {
        String displayName = jdbcTemplate.queryForObject(SQL_GET_DISPLAY_NAME, String.class, blogPost.getAuthor());
        jdbcTemplate.update(SQL_ADD_POST, blogPost.getTitle(),
                displayName, blogPost.getDatePosted(),
                blogPost.getContent(), blogPost.getStatus());

        int id = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()",
                Integer.class);

        blogPost.setId(id);

        return blogPost;
    }

    // Get blog post by ID
    private static final String SQL_GET_POST_BY_ID
            = "SELECT * FROM Posts WHERE postId = ?";

    @Override
    public BlogPost getBlogPostById(int id) {
        try {
            return jdbcTemplate.queryForObject(SQL_GET_POST_BY_ID, // select stmt
                    new PostMapper(), // what we're turning the RS into!
                    id); // and then subsitituting in any placeholders
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    private static final String SQL_GET_ALL_POSTS
            = "SELECT * FROM Posts";
    
    @Override
    public List<BlogPost> getAllBlogPosts() {
        return jdbcTemplate.query(SQL_GET_ALL_POSTS, new PostMapper());
    }
    
    @Override
    public List<BlogPost> searchBlogPosts(Map<SearchTerm, String> criteria) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    // Update blog post
    private static final String SQL_UPDATE_POST_BY_ID
            = "UPDATE Posts SET title = ?, content = ?, author = ?, "
            + "datePosted = ?, status = ? "
            + "WHERE Posts.postId = ?";

    @Override
    public void updateBlogPost(BlogPost updatedPage) {
        jdbcTemplate.update(SQL_UPDATE_POST_BY_ID,
                updatedPage.getTitle(),
                updatedPage.getContent(),
                updatedPage.getAuthor(),
                updatedPage.getDatePosted(),
                updatedPage.getStatus(),
                updatedPage.getId());
    }

    private static final String SQL_DELETE_POST_BY_ID
            = "DELETE FROM Posts WHERE postId = ?";
    
    @Override
    public void removeBlogPost(int id) {
        jdbcTemplate.update(SQL_DELETE_POST_BY_ID, id);
    }

    private static final String SQL_GET_POST_BY_AUTHOR
            = "SELECT * FROM Posts WHERE author = ?";

    @Override
    public List<BlogPost> getBlogPostsByAuthor(String author) {
        try {
            return jdbcTemplate.query(SQL_GET_POST_BY_AUTHOR, // select stmt
                    new PostMapper(), // what we're turning the RS into!
                    author); // and then subsitituting in any placeholders
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    private static final class PostMapper implements RowMapper<BlogPost> {

        @Override
        public BlogPost mapRow(ResultSet rs, int rowNum) throws SQLException {
            BlogPost post = new BlogPost();
            int id = rs.getInt("postId");
            String title = rs.getString("title");
            String author = rs.getString("author");
            String datePosted = rs.getString("datePosted");
            String content = rs.getString("content");
            int status = rs.getInt("status");

            // set properties
            post.setId(id);
            post.setTitle(title);
            post.setAuthor(author);
            post.setDatePosted(datePosted);
            post.setContent(content);
            post.setStatus(status);

            return post;
        }

    }
}
