package model;

import java.io.Serializable;
import java.sql.Date;

public class KhachHang extends AbsModel implements Serializable, IModel {
    private int maKH;
    private String tenKH;
    private String email;
    private String matKhau;

    private String soDT;

    private String gioiTinh;

    private Date ngaySinh;

    private String diaChi;

    private int maTC;

    private String code;

    private String picture;

    private TruyCap truyCap;

    public KhachHang(){}

    public KhachHang(String email, String matKhau) {
        this.email = email;
        this.matKhau = matKhau;
    }
    public KhachHang(String tenKH){
        this.tenKH = tenKH;
    }
    public KhachHang(int maKH, String tenKH){
        this.maKH = maKH;
        this.tenKH = tenKH;
    }

    public KhachHang(int maKH, String tenKH, String email, String matKhau, String soDT, String gioiTinh, Date ngaySinh, String diaChi, int maTC) {
        this.maKH = maKH;
        this.tenKH = tenKH;
        this.email = email;
        this.matKhau = matKhau;
        this.soDT = soDT;
        this.gioiTinh = gioiTinh;
        this.ngaySinh = ngaySinh;
        this.diaChi = diaChi;
        this.maTC = maTC;
    }
    public KhachHang(int maKH, String tenKH, String email, String matKhau, String soDT, String gioiTinh, Date ngaySinh, String diaChi, TruyCap truyCap) {
        this.maKH = maKH;
        this.tenKH = tenKH;
        this.email = email;
        this.matKhau = matKhau;
        this.soDT = soDT;
        this.gioiTinh = gioiTinh;
        this.ngaySinh = ngaySinh;
        this.diaChi = diaChi;
        this.truyCap = truyCap;
    }

    public KhachHang(int maKH, String tenKH, String email, String soDT, String gioiTinh, Date ngaySinh) {
        this.maKH = maKH;
        this.tenKH = tenKH;
        this.email = email;
        this.soDT = soDT;
        this.gioiTinh = gioiTinh;
        this.ngaySinh = ngaySinh;
    }

    public KhachHang(int maKH, String tenKH, String email, String matKhau, String soDT, String gioiTinh, Date ngaySinh, String diaChi, int maTC, String code, String picture) {
        this.maKH = maKH;
        this.tenKH = tenKH;
        this.email = email;
        this.matKhau = matKhau;
        this.soDT = soDT;
        this.gioiTinh = gioiTinh;
        this.ngaySinh = ngaySinh;
        this.diaChi = diaChi;
        this.maTC = maTC;
        this.code = code;
        this.picture = picture;
    }

    public KhachHang(int maKH) {
        this.maKH = maKH;
    }

    public KhachHang(int maKH, String tenKH, String email, String matKhau, String soDT, String gioiTinh, Date ngaySinh, int maTC) {
        this.maKH = maKH;
        this.tenKH = tenKH;
        this.email = email;
        this.matKhau = matKhau;
        this.soDT = soDT;
        this.gioiTinh = gioiTinh;
        this.ngaySinh = ngaySinh;
        this.maTC = maTC;
    }

    public int getMaKH() {
        return maKH;
    }

    public void setMaKH(int maKH) {
        this.maKH = maKH;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getSoDT() {
        return soDT;
    }

    public void setSoDT(String soDT) {
        this.soDT = soDT;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public int getMaTC() {
        return maTC;
    }

    public void setMaTC(int maTC) {
        this.maTC = maTC;
    }

    public String getCode() {return code;}

    public void setCode(String code) {
        this.code = code;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    @Override
    public String toString() {
        return "KhachHang{" +
                "maKH=" + maKH +
                ", tenKH='" + tenKH + '\'' +
                ", email='" + email + '\'' +
                ", matKhau='" + matKhau + '\'' +
                ", soDT='" + soDT + '\'' +
                ", gioiTinh='" + gioiTinh + '\'' +
                ", ngaySinh=" + ngaySinh +
                ", diaChi='" + diaChi + '\'' +
                ", maTC=" + maTC +
                ", picture='" + picture + '\'' +
                '}';
    }

    @Override
    public String beforeValue() {
        return "{"
                + "maKH: "+ maKH + ","
                + "tenKH: " + tenKH + ","
                + "email: " + email + ","
                + "matKhau: " + matKhau + ","
                + "soDT: " + soDT + ","
                + "diaChi: " + diaChi + ","
                + "maTC: " + maTC + ","
                + "}";
    }

    @Override
    public String afterValue() {
        return "{"
                + "maKH: "+ maKH + ","
                + "tenKH: " + tenKH + ","
                + "email: " + email + ","
                + "matKhau: " + matKhau + ","
                + "soDT: " + soDT + ","
                + "diaChi: " + diaChi + ","
                + "maTC: " + maTC + ","
                + "}";
    }
}
