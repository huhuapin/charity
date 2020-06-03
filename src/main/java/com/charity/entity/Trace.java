package com.charity.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (Trace)实体类
 *
 * @author hhp
 * @since 2020-05-10 21:32:54
 */
public class Trace implements Serializable {
    private static final long serialVersionUID = -63156117470846422L;
    
    private Integer id;
    
    private Integer applymentId;
    
    private String title;
    
    private Object content;
    
    private Date time;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getApplymentId() {
        return applymentId;
    }

    public void setApplymentId(Integer applymentId) {
        this.applymentId = applymentId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

}