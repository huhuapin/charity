package com.charity.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (Donee)实体类
 *
 * @author hhp
 * @since 2020-05-10 21:31:55
 */
public class Donee implements Serializable {
    private static final long serialVersionUID = -87458696519191488L;
    
    private Integer id;
    
    private Integer userId;
    
    private String description;
    
    private Integer authorityId;
    
    private Integer sex;
    
    private Date birthday;
    
    private String address;
    
    private String tel;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getAuthorityId() {
        return authorityId;
    }

    public void setAuthorityId(Integer authorityId) {
        this.authorityId = authorityId;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

}