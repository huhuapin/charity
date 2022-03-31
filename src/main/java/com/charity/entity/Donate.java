package com.charity.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (Donate)实体类
 *
 * @author hhp
 * @since 2020-06-03 21:38:31
 */
public class Donate implements Serializable {
    private static final long serialVersionUID = -96459347600586647L;
    
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
    
    private Integer authorityId;


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

    public Integer getAuthorityId() {
        return authorityId;
    }

    public void setAuthorityId(Integer authorityId) {
        this.authorityId = authorityId;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Donate{");
        sb.append("id=").append(id);
        sb.append(", donorId=").append(donorId);
        sb.append(", applicationId=").append(applicationId);
        sb.append(", money=").append(money);
        sb.append(", isAnoymous=").append(isAnoymous);
        sb.append(", message='").append(message).append('\'');
        sb.append(", prove='").append(prove).append('\'');
        sb.append(", date=").append(date);
        sb.append(", status=").append(status);
        sb.append(", authorityId=").append(authorityId);
        sb.append('}');
        return sb.toString();
    }
}