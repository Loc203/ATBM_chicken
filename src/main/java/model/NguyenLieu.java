package model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class NguyenLieu extends AbsModel implements Serializable {

    private int id;
    private String nguyenlieu;
    private int soluong;
    private String noidung;
    private String loai;
    private LocalDateTime thoigian;
    private String donvi;
    private double gia;
    private double tong;

    public NguyenLieu() {
    }

    public NguyenLieu(int id, String nguyenlieu, int soluong, String noidung, String loai, LocalDateTime thoigian, String donvi, double gia, double tong) {
        this.id = id;
        this.nguyenlieu = nguyenlieu;
        this.soluong = soluong;
        this.noidung = noidung;
        this.loai = loai;
        this.thoigian = thoigian;
        this.donvi = donvi;
        this.gia = gia;
        this.tong = tong;
    }

    public NguyenLieu(int id, String nguyenlieu, int soluong, String noidung, String loai, LocalDateTime thoigian, String donvi, double gia) {
        this.id = id;
        this.nguyenlieu = nguyenlieu;
        this.soluong = soluong;
        this.noidung = noidung;
        this.loai = loai;
        this.thoigian = thoigian;
        this.donvi = donvi;
        this.gia = gia;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNguyenlieu() {
        return nguyenlieu;
    }

    public void setNguyenlieu(String nguyenlieu) {
        this.nguyenlieu = nguyenlieu;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public String getNoidung() {
        return noidung;
    }

    public void setNoidung(String noidung) {
        this.noidung = noidung;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    public LocalDateTime getThoigian() {
        return thoigian;
    }

    public void setThoigian(LocalDateTime thoigian) {
        this.thoigian = thoigian;
    }

    public String getDonvi() {
        return donvi;
    }

    public void setDonvi(String donvi) {
        this.donvi = donvi;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public double getTong() {
        return tong;
    }

    public void setTong(double tong) {
        this.tong = tong;
    }

    @Override
    public String toString() {
        return "NguyenLieu{" +
                "id=" + id +
                ", nguyenlieu='" + nguyenlieu + '\'' +
                ", soluong=" + soluong +
                ", noidung='" + noidung + '\'' +
                ", loai='" + loai + '\'' +
                ", thoigian=" + thoigian +
                ", donvi='" + donvi + '\'' +
                ", gia=" + gia +
                ", tong=" + tong +
                '}';
    }

    @Override
    public String beforeValue() {
        return "{"
                + "id: "+ id + ","
                + "nguyenlieu: " + nguyenlieu + ","
                + "soluong: " + soluong + ","
                + "noidung: " + noidung + ","
                + "loai: " + loai + ","
                + "thoigian: " + thoigian + ","
                + "donvi: " + donvi + ","
                + "gia: " + gia + ","
                + "tong: " + tong
                + "}";
    }
}
