package model;

import java.io.Serializable;
import java.sql.Date;

public class XacThuc implements Serializable {
    private int maXacThuc;
    private int maKH;
    private Date ngayHetHan;

    public XacThuc() {
    }

    public XacThuc(int maXacThuc, int maKH, Date ngayHetHan) {
        this.maXacThuc = maXacThuc;
        this.maKH = maKH;
        this.ngayHetHan = ngayHetHan;
    }

    public int getMaXacThuc() {
        return maXacThuc;
    }

    public void setMaXacThuc(int maXacThuc) {
        this.maXacThuc = maXacThuc;
    }

    public int getMaKH() {
        return maKH;
    }

    public void setMaKH(int maKH) {
        this.maKH = maKH;
    }

    public Date getNgayHetHan() {
        return ngayHetHan;
    }

    public void setNgayHetHan(Date ngayHetHan) {
        this.ngayHetHan = ngayHetHan;
    }

    @Override
    public String toString() {
        return "XacThuc{" +
                "maXacThuc=" + maXacThuc +
                ", maKH=" + maKH +
                ", ngayHetHan=" + ngayHetHan +
                '}';
    }
}
