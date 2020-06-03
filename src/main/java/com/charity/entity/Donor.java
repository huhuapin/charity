package com.charity.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * (Donor)实体类
 *
 * @author hhp
 * @since 2020-05-11 18:33:45
 */
public class Donor implements Serializable {
    private static final long serialVersionUID = -22885020027554709L;
    
    private Integer id;
    
    private Integer userId;
    
    private String career;
    
    private String email;
    
    private Integer sex;
    
    private Date birthday;
    
    private String address;
    
    private Integer tel;


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

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public Integer getTel() {
        return tel;
    }

    public void setTel(Integer tel) {
        this.tel = tel;
    }

}