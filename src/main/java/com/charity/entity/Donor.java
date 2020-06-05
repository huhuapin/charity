package com.charity.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * (Donor)实体类
 *
 * @author hhp
 * @since 2020-06-04 16:29:31
 */
public class Donor implements Serializable {
    private static final long serialVersionUID = -93171926881180465L;
    
    private Integer id;
    
    private Integer userId;
    
    private String career;
    
    private String email;
    
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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Donor{");
        sb.append("id=").append(id);
        sb.append(", userId=").append(userId);
        sb.append(", career='").append(career).append('\'');
        sb.append(", email='").append(email).append('\'');
        sb.append(", sex=").append(sex);
        sb.append(", birthday=").append(birthday);
        sb.append(", address='").append(address).append('\'');
        sb.append(", tel='").append(tel).append('\'');
        sb.append('}');
        return sb.toString();
    }
}