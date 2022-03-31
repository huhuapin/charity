package com.charity.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.Serializable;

/**
 * (Donee)实体类
 *
 * @author hhp
 * @since 2020-06-04 16:29:10
 */
public class Donee implements Serializable {
    private static final long serialVersionUID = 708043451171711805L;
    
    private Integer id;
    
    private Integer userId;
    
    private String description;
    
    private Integer authorityId;
    
    private String email;
    
    private Integer sex;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
    public String getStringDate() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(this.birthday);
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Donee{");
        sb.append("id=").append(id);
        sb.append(", userId=").append(userId);
        sb.append(", description='").append(description).append('\'');
        sb.append(", authorityId=").append(authorityId);
        sb.append(", email='").append(email).append('\'');
        sb.append(", sex=").append(sex);
        sb.append(", birthday=").append(birthday);
        sb.append(", address='").append(address).append('\'');
        sb.append(", tel='").append(tel).append('\'');
        sb.append('}');
        return sb.toString();
    }
}