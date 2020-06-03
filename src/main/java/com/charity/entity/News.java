package com.charity.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (News)实体类
 *
 * @author hhp
 * @since 2020-05-10 21:32:40
 */
public class News implements Serializable {
    private static final long serialVersionUID = -61367957764996280L;
    
    private Integer id;
    
    private Integer authorityId;
    
    private String title;
    
    private String description;
    
    private String thumb;
    
    private Object content;
    
    private Date time;
    
    private Integer click;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAuthorityId() {
        return authorityId;
    }

    public void setAuthorityId(Integer authorityId) {
        this.authorityId = authorityId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    public Object getContent() {
        return content;
    }

    public void setContent(Object content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

}