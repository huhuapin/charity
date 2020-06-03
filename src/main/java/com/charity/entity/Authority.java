package com.charity.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.io.Serializable;

/**
 * (Authority)实体类
 *
 * @author hhp
 * @since 2020-05-29 19:20:47
 */
public class Authority implements Serializable {
    private static final long serialVersionUID = 153939957193091633L;
    
    private Integer id;
    
    private Integer userId;
    
    private Integer found;
    
    private Integer people;
    
    private Object description;
    
    private Integer tel;
    
    private String address;
    
    private String represent;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdTime;
    
    private Integer status;

    private User user;


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

    public Integer getFound() {
        return found;
    }

    public void setFound(Integer found) {
        this.found = found;
    }

    public Integer getPeople() {
        return people;
    }

    public void setPeople(Integer people) {
        this.people = people;
    }

    public Object getDescription() {
        return description;
    }

    public void setDescription(Object description) {
        this.description = description;
    }

    public Integer getTel() {
        return tel;
    }

    public void setTel(Integer tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRepresent() {
        return represent;
    }

    public void setRepresent(String represent) {
        this.represent = represent;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Authority{");
        sb.append("id=").append(id);
        sb.append(", userId=").append(userId);
        sb.append(", found=").append(found);
        sb.append(", people=").append(people);
        sb.append(", description=").append(description);
        sb.append(", tel=").append(tel);
        sb.append(", address='").append(address).append('\'');
        sb.append(", represent='").append(represent).append('\'');
        sb.append(", createdTime=").append(createdTime);
        sb.append(", status=").append(status);
        sb.append('}');
        return sb.toString();
    }
}