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

import com.tsguild.lvl2.dto.StaticPage;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Dan Whitlow
 */
public class StaticPageDaoImpl implements StaticPageDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String SQL_ADD_PAGE
            = "insert into StaticPages(pageTitle, `status`, layout) values(?, ?, ?)";
    private static final String SQL_ADD_CONTENT
            = "insert into StaticPageContents(pageID, content) values(?, ?)";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public StaticPage addStaticPage(StaticPage staticPage) {
        jdbcTemplate.update(SQL_ADD_PAGE, staticPage.getTitle(), staticPage.getStatus(), staticPage.getLayout());
        staticPage.setId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class));

        if (staticPage.getContent1() != null) {
            String content = staticPage.getContent1();
            jdbcTemplate.update(SQL_ADD_CONTENT, staticPage.getId(), content);
        }

        if (staticPage.getContent2() != null) {
            String content = staticPage.getContent2();
            jdbcTemplate.update(SQL_ADD_CONTENT, staticPage.getId(), content);
        }

        if (staticPage.getContent3() != null) {
            String content = staticPage.getContent3();
            jdbcTemplate.update(SQL_ADD_CONTENT, staticPage.getId(), content);
        }

        return staticPage;
    }

    //Get static page by ID
    private static final String SQL_GET_PAGE
            = "SELECT * "
            + "FROM StaticPages WHERE pageId = ?";

    private static final String SQL_GET_CONTENT = "select content from StaticPages join StaticPageContents on StaticPages.pageId=StaticPageContents.pageId where StaticPages.pageId = ? limit ?,1";

    @Override
    public StaticPage getStaticPageById(int id) {
        try {
            StaticPage page = jdbcTemplate.queryForObject(SQL_GET_PAGE, // select stmt
                    new PageMapper(), // what we're turning the RS into!
                    id); // and then subsitituting in any placeholders

            String content1;
            String content2;
            String content3;

            try {
                content1 = jdbcTemplate.queryForObject(SQL_GET_CONTENT, String.class, page.getId(), 0);
                page.setContent1(content1);
            } catch (EmptyResultDataAccessException e) {
                content1 = null;
            }

            try {
                content2 = jdbcTemplate.queryForObject(SQL_GET_CONTENT, String.class, page.getId(), 1);
                page.setContent2(content2);
            } catch (EmptyResultDataAccessException e) {
                content2 = null;
            }

            try {
                content3 = jdbcTemplate.queryForObject(SQL_GET_CONTENT, String.class, page.getId(), 2);
                page.setContent3(content3);
            } catch (EmptyResultDataAccessException e) {
                content3 = null;
            }

            return page;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    private static final String SQL_GET_ALL_PAGES
            = "SELECT * FROM StaticPages";

    @Override
    public List<StaticPage> getAllStaticPages() {
        List<StaticPage> pages = jdbcTemplate.query(SQL_GET_ALL_PAGES, new PageMapper());

        for (StaticPage page : pages) {
            String content1;
            String content2;
            String content3;

            try {
                content1 = jdbcTemplate.queryForObject(SQL_GET_CONTENT, String.class, page.getId(), 0);
                page.setContent1(content1);
            } catch (EmptyResultDataAccessException e) {
                content1 = null;
            }

            try {
                content2 = jdbcTemplate.queryForObject(SQL_GET_CONTENT, String.class, page.getId(), 1);
                page.setContent2(content2);
            } catch (EmptyResultDataAccessException e) {
                content2 = null;
            }

            try {
                content3 = jdbcTemplate.queryForObject(SQL_GET_CONTENT, String.class, page.getId(), 2);
                page.setContent3(content3);
            } catch (EmptyResultDataAccessException e) {
                content3 = null;
            }
        }
        return pages;
    }

    private static final String SQL_UPDATE_PAGE
            = "UPDATE StaticPages SET pageTitle = ?, `status` = ?, layout = ? where StaticPages.pageId = ?";
    
    @Override
    public void updateStaticPage(StaticPage updatedPage) {
        jdbcTemplate.update(SQL_UPDATE_PAGE, updatedPage.getTitle(), updatedPage.getStatus(), updatedPage.getLayout(), updatedPage.getId());
    }

    private static final String SQL_REMOVE_PAGE
            = "DELETE FROM StaticPages WHERE pageId = ?";

    private static final String SQL_REMOVE_PAGE_CONTENTS
            = "DELETE FROM StaticPageContents WHERE pageId = ?";
    
    @Override
    public void removeStaticPage(int id) {
        jdbcTemplate.update(SQL_REMOVE_PAGE_CONTENTS, id);
        jdbcTemplate.update(SQL_REMOVE_PAGE, id);
    }

    private static final class PageMapper implements RowMapper<StaticPage> {

        @Override
        public StaticPage mapRow(ResultSet rs, int rowNum) throws SQLException {
            StaticPage mappedPage = new StaticPage();

            mappedPage.setId(Integer.parseInt(rs.getString("pageId")));
            mappedPage.setTitle(rs.getString("pageTitle"));
            mappedPage.setStatus(rs.getInt("status"));
            mappedPage.setLayout(rs.getInt("layout"));

            return mappedPage;
        }

    }

}
