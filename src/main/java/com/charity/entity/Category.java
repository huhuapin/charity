package com.charity.entity;

import java.io.Serializable;

/**
 * (Category)实体类
 *
 * @author hhp
 * @since 2020-05-30 15:15:55
 */
public class Category implements Serializable {
    private static final long serialVersionUID = 957491404490591826L;
    
    private Integer id;
    
    private String category;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

}