package com.charity.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (Application)实体类
 *
 * @author hhp
 * @since 2020-06-02 16:42:03
 */
public class Application implements Serializable {
    private static final long serialVersionUID = -30394427276431441L;
    
    private Integer id;
    
    private Integer autorityId;
    
    private Integer doneeId;
    
    private String title;
    
    private Object description;
    
    private Integer categoryId;
    
    private String img;
    
    private Double target;
    
    private Integer donoorNum;
    
    private Date start;
    
    private Date end;

    private double W;
    /**
    * 待审核0，未开始1，进行中,2，待处理3，已完成4，未通过5
    */
    private Integer status;
    
    private Integer urgent;
    
    private Double receive;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAutorityId() {
        return autorityId;
    }

    public void setAutorityId(Integer autorityId) {
        this.autorityId = autorityId;
    }

    public Integer getDoneeId() {
        return doneeId;
    }

    public void setDoneeId(Integer doneeId) {
        this.doneeId = doneeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Object getDescription() {
        return description;
    }

    public void setDescription(Object description) {
        this.description = description;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Double getTarget() {
        return target;
    }

    public void setTarget(Double target) {
        this.target = target;
    }

    public Integer getDonoorNum() {
        return donoorNum;
    }

    public void setDonoorNum(Integer donoorNum) {
        this.donoorNum = donoorNum;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getUrgent() {
        return urgent;
    }

    public void setUrgent(Integer urgent) {
        this.urgent = urgent;
    }

    public Double getReceive() {
        return receive;
    }

    public void setReceive(Double receive) {
        this.receive = receive;
    }

    public double getW() {
        return W;
    }

    public void setW(double w) {
        W = w;
    }
}