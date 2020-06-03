package com.charity.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (Donate)实体类
 *
 * @author hhp
 * @since 2020-05-31 16:07:42
 */
public class Donate implements Serializable {
    private static final long serialVersionUID = 464521715200139962L;
    
    private Integer id;
    
    private Integer donorId;
    
    private Integer applicationId;
    
    private Double money;
    
    private Integer isAnoymous;
    
    private String message;
    /**
    * 捐赠证明
    */
    private String prove;
    
    private Date date;
    
    private Integer status;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDonorId() {
        return donorId;
    }

    public void setDonorId(Integer donorId) {
        this.donorId = donorId;
    }

    public Integer getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(Integer applicationId) {
        this.applicationId = applicationId;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Integer getIsAnoymous() {
        return isAnoymous;
    }

    public void setIsAnoymous(Integer isAnoymous) {
        this.isAnoymous = isAnoymous;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getProve() {
        return prove;
    }

    public void setProve(String prove) {
        this.prove = prove;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}