package com.charity.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
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
    
    private Integer authorityId;

    private Integer doneeId;
    
    private String title;
    
    private Object description;
    
    private Integer categoryId;
    
    private String img;
    
    private Double target;
    
    private Integer donoorNum;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date start;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date end;

    private double W;
    /**
    * 待审核0，未开始1，进行中2，已完成3，未通过4 ,
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

    public Integer getAuthorityId() {
        return authorityId;
    }

    public void setAuthorityId(Integer authorityId) {
        this.authorityId = authorityId;
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

    public String getStartString() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(this.start);
    }
    public String getEndString() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(this.end);
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Application{");
        sb.append("id=").append(id);
        sb.append(", authorityId=").append(authorityId);
        sb.append(", doneeId=").append(doneeId);
        sb.append(", title='").append(title).append('\'');
        sb.append(", description=").append(description);
        sb.append(", categoryId=").append(categoryId);
        sb.append(", img='").append(img).append('\'');
        sb.append(", target=").append(target);
        sb.append(", donoorNum=").append(donoorNum);
        sb.append(", start=").append(start);
        sb.append(", end=").append(end);
        sb.append(", W=").append(W);
        sb.append(", status=").append(status);
        sb.append(", urgent=").append(urgent);
        sb.append(", receive=").append(receive);
        sb.append('}');
        return sb.toString();
    }
}