package com.bb.entity;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
    private long userId;
    private String userName;
    private long credits;
    private String password;
    private Date lastVisit;
    private String lastIp;

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public long getCredits() {
        return credits;
    }

    public void setCredits(long credits) {
        this.credits = credits;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getLastVisit() {
        return lastVisit;
    }

    public void setLastVisit(Date lastVisit) {
        this.lastVisit = lastVisit;
    }

    public String getLastIp() {
        return lastIp;
    }

    public void setLastIp(String lastIp) {
        this.lastIp = lastIp;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", credits=" + credits +
                ", password='" + password + '\'' +
                ", lastVisit=" + lastVisit +
                ", lastIp='" + lastIp + '\'' +
                '}';
    }
}
