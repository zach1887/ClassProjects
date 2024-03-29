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
import com.tsguild.lvl2.dto.Comment;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Dan Whitlow
 */
public interface BlogPostDao {

    public BlogPost addBlogPost(BlogPost blogPost);

    public BlogPost getBlogPostById(int id);

    public List<BlogPost> getAllBlogPosts();

    public List<BlogPost> searchBlogPosts(Map<SearchTerm, String> criteria);

    public void updateBlogPost(BlogPost updatedPage);

    public void removeBlogPost(int id);

    public List<BlogPost> getBlogPostsByAuthor(String author);

    public void approveComment(int commentId);

    public void declineComment(int commentId);

    public Comment createComment(Comment comment);

    public void deleteComment(int id);

    public List<Comment> loadCommentsByBlogId(int id);

    public void updateTagTable(BlogPost extractedBlog);

    public void updateBridgeTable(int postId, List<Integer> TagArray);

    public List<BlogPost> getBlogPostsByTagID(int tagID);

    public String getTagNameFromID(int tagId);

    public int countCommentsById(int id);
    
    public List<Integer> extractTagsByPostId(int postId);

    public List<BlogPost> getRecentPosts();

}
