package model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Log implements Serializable {
    private int id;
    private LogLevels logLevels;
    private String ip;
    private String address;
    private String beforeValue;
    private String afterValue;
    private LocalDateTime createAt;

    public Log() {
    }

    public Log(int id, LogLevels logLevels, String ip, String address, String beforeValue, String afterValue, LocalDateTime createAt) {
        this.id = id;
        this.logLevels = logLevels;
        this.ip = ip;
        this.address = address;
        this.beforeValue = beforeValue;
        this.afterValue = afterValue;
        this.createAt = createAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LogLevels getLogLevels() {
        return logLevels;
    }

    public void setLogLevels(LogLevels logLevels) {
        this.logLevels = logLevels;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBeforeValue() {
        return beforeValue;
    }

    public void setBeforeValue(String beforeValue) {
        this.beforeValue = beforeValue;
    }

    public String getAfterValue() {
        return afterValue;
    }

    public void setAfterValue(String afterValue) {
        this.afterValue = afterValue;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", logLevels=" + logLevels +
                ", ip='" + ip + '\'' +
                ", address='" + address + '\'' +
                ", beforeValue='" + beforeValue + '\'' +
                ", afterValue='" + afterValue + '\'' +
                ", createAt=" + createAt +
                '}';
    }
}
