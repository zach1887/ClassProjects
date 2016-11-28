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

/**
 *
 * @author Dan Whitlow
 */
public class StaticPageDaoImpl implements StaticPageDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public StaticPage addStaticPage(StaticPage staticPage) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //Get static page by ID
    private static final String SQL_GET_PAGE
            = "SELECT * "
            + "FROM StaticPages WHERE pageId = ?";

    @Override
    public StaticPage getStaticPageById(int id) {
        try {
            int test = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);
            return jdbcTemplate.queryForObject(SQL_GET_PAGE, // select stmt
                    new PageMapper(), // what we're turning the RS into!
                    id); // and then subsitituting in any placeholders
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public List<StaticPage> getAllStaticPages() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void updateStaticPage(StaticPage updatedPage) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void removeStaticPage(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    
    private static final class PageMapper implements RowMapper<StaticPage>{

        @Override
        public StaticPage mapRow(ResultSet rs, int rowNum) throws SQLException {
            StaticPage mappedPage = new StaticPage();
            
            mappedPage.setId(Integer.parseInt(rs.getString("pageId")));
            mappedPage.setTitle(rs.getString("pageTitle"));
            mappedPage.setContent(rs.getString("pageContent"));
            mappedPage.setStatus(Integer.parseInt(rs.getString("status")));
            
            return mappedPage;
        }
        
    }

}
