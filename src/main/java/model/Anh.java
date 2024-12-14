package model;

import java.io.Serializable;

public class Anh implements Serializable {
    private int maAnh;
    private int maSP;

    private String duongDan;

    private String chuThich;

    public Anh() {}

    public Anh(int maAnh, String duongDan) {
        this.maAnh = maAnh;
        this.duongDan = duongDan;
    }

    public Anh(int maAnh, int maSP, String duongDan, String chuThich) {
        this.maAnh = maAnh;
        this.maSP = maSP;
        this.duongDan = duongDan;
        this.chuThich = chuThich;
    }

    public Anh(int maAnh) {
        this.maAnh = maAnh;
    }

    public int getMaAnh() {
        return maAnh;
    }

    public void setMaAnh(int maAnh) {
        this.maAnh = maAnh;
    }

    public int getMaSP() {
        return maSP;
    }

    public void setMaSP(int maSP) {
        this.maSP = maSP;
    }

    public String getDuongDan() {
        return duongDan;
    }

    public void setDuongDan(String duongDan) {
        this.duongDan = duongDan;
    }

    public String getChuThich() {
        return chuThich;
    }

    public void setChuThich(String chuThich) {
        this.chuThich = chuThich;
    }

    @Override
    public String toString() {
        return "Anh{" +
                "maAnh=" + maAnh +
                ", maSP=" + maSP +
                ", duongDan='" + duongDan + '\'' +
                ", chuThich='" + chuThich + '\'' +
                '}';
    }
}
