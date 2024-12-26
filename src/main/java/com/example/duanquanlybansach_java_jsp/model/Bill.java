package com.example.duanquanlybansach_java_jsp.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Bill {
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Bill(int id, int userId, LocalDateTime dateTime, BigDecimal total, String PTTT) {
        this.id = id;
        this.userId = userId;
        this.dateTime = dateTime;
        this.total = total;
        this.PTTT = PTTT;
    }

    private int userId;
    private LocalDateTime dateTime;
    private BigDecimal total;
    private String PTTT;

    public Bill() {
    }

    public Bill(int userId, LocalDateTime dateTime, BigDecimal total, String PTTT) {
        this.userId = userId;
        this.dateTime = dateTime;
        this.total = total;
        this.PTTT = PTTT;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public String getPTTT() {
        return PTTT;
    }

    public void setPTTT(String PTTT) {
        this.PTTT = PTTT;
    }
}
