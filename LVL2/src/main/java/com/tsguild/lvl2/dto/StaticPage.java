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
package com.tsguild.lvl2.dto;

import java.util.ArrayList;
import java.util.Objects;

/**
 *
 * @author Dan Whitlow
 */
public class StaticPage {

    private int id;
    private String title;
    private String content1;
    private String content2;
    private String content3;
    private int status;
    private int layout;

    // Constructors
    public StaticPage() {

    }

    public StaticPage(int id, String title, int status, int layout) {
        this.title = title;
        this.id = id;
        this.status = status;
        this.layout = layout;
    }

    public StaticPage(String title, String content1, int status, int layout) {
        this.title = title;
        this.content1 = content1;
        this.status = status;
        this.layout = layout;
    }

    public StaticPage(int id, String title, String content1, int status, int layout) {
        this.id = id;
        this.title = title;
        this.content1 = content1;
        this.status = status;
        this.layout = layout;
    }

    public StaticPage(int id, String title, String content1, String content2, int status, int layout) {
        this.id = id;
        this.title = title;
        this.content1 = content1;
        this.content2 = content2;
        this.status = status;
        this.layout = layout;
    }

    public StaticPage(int id, String title, String content1, String content2, String content3, int status, int layout) {
        this.id = id;
        this.title = title;
        this.content1 = content1;
        this.content1 = content2;
        this.content1 = content3;
        this.status = status;
        this.layout = layout;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent1() {
        return content1;
    }

    public void setContent1(String content1) {
        this.content1 = content1;
    }

    public String getContent2() {
        return content2;
    }

    public void setContent2(String content2) {
        this.content2 = content2;
    }

    public String getContent3() {
        return content3;
    }

    public void setContent3(String content3) {
        this.content3 = content3;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getLayout() {
        return layout;
    }

    public void setLayout(int layout) {
        this.layout = layout;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 53 * hash + this.id;
        hash = 53 * hash + Objects.hashCode(this.title);
        hash = 53 * hash + Objects.hashCode(this.content1);
        hash = 53 * hash + Objects.hashCode(this.content2);
        hash = 53 * hash + Objects.hashCode(this.content3);
        hash = 53 * hash + this.status;
        hash = 53 * hash + this.layout;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final StaticPage other = (StaticPage) obj;
        if (this.id != other.id) {
            return false;
        }
        if (this.status != other.status) {
            return false;
        }
        if (this.layout != other.layout) {
            return false;
        }
        if (!Objects.equals(this.title, other.title)) {
            return false;
        }
        if (!Objects.equals(this.content1, other.content1)) {
            return false;
        }
        if (!Objects.equals(this.content2, other.content2)) {
            return false;
        }
        if (!Objects.equals(this.content3, other.content3)) {
            return false;
        }
        return true;
    }

   

    
}
