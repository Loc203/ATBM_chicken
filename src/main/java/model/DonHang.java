package model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class DonHang extends AbsModel implements Serializable, IModel {

    private int maDH;
    private int maKH;
    private String diaChiNhanHang;
    private String soDienThoai;
    private LocalDateTime ngayDatHang;
    private LocalDateTime ngayNhanHang;
    private String trangThai;
    private String thanhToan;

    private double phiVanChuyen;

    private String tenKH;

    public DonHang() {
    }

    public DonHang(int maDH) {
        this.maDH = maDH;
    }

    public DonHang(int maDH, int maKH, String diaChiNhanHang, LocalDateTime ngayDatHang, LocalDateTime ngayNhanHang, String trangThai, String thanhToan) {
        this.maDH = maDH;
        this.maKH = maKH;
        this.diaChiNhanHang = diaChiNhanHang;
        this.ngayDatHang = ngayDatHang;
        this.ngayNhanHang = ngayNhanHang;
        this.trangThai = trangThai;
        this.thanhToan = thanhToan;
    }

    public DonHang(int maKH, String diaChiNhanHang, LocalDateTime ngayDatHang, LocalDateTime ngayNhanHang, String trangThai, String thanhToan) {
        this.maKH = maKH;
        this.diaChiNhanHang = diaChiNhanHang;
        this.ngayDatHang = ngayDatHang;
        this.ngayNhanHang = ngayNhanHang;
        this.trangThai = trangThai;
        this.thanhToan = thanhToan;
    }

    public DonHang(int maDH, int maKH, String diaChiNhanHang, String soDienThoai, LocalDateTime ngayDatHang, LocalDateTime ngayNhanHang, String trangThai, String thanhToan) {
        this.maDH = maDH;
        this.maKH = maKH;
        this.diaChiNhanHang = diaChiNhanHang;
        this.soDienThoai = soDienThoai;
        this.ngayDatHang = ngayDatHang;
        this.ngayNhanHang = ngayNhanHang;
        this.trangThai = trangThai;
        this.thanhToan = thanhToan;
    }

    public DonHang(int maDH, int maKH, String diaChiNhanHang, String soDienThoai, LocalDateTime ngayDatHang, LocalDateTime ngayNhanHang, String trangThai, String thanhToan, String tenKH, double phiVanChuyen) {
        this.maDH = maDH;
        this.maKH = maKH;
        this.diaChiNhanHang = diaChiNhanHang;
        this.soDienThoai = soDienThoai;
        this.ngayDatHang = ngayDatHang;
        this.ngayNhanHang = ngayNhanHang;
        this.trangThai = trangThai;
        this.thanhToan = thanhToan;
        this.tenKH = tenKH;
        this.phiVanChuyen = phiVanChuyen;
    }

    public DonHang(int maDH, int maKH, String diaChiNhanHang, String soDienThoai, LocalDateTime ngayDatHang, LocalDateTime ngayNhanHang, String trangThai, String thanhToan, double phiVanChuyen) {
        this.maDH = maDH;
        this.maKH = maKH;
        this.diaChiNhanHang = diaChiNhanHang;
        this.soDienThoai = soDienThoai;
        this.ngayDatHang = ngayDatHang;
        this.ngayNhanHang = ngayNhanHang;
        this.trangThai = trangThai;
        this.thanhToan = thanhToan;
        this.phiVanChuyen = phiVanChuyen;
    }

    public int getMaDH() {
        return maDH;
    }

    public void setMaDH(int maDH) {
        this.maDH = maDH;
    }

    public int getMaKH() {
        return maKH;
    }

    public void setMaKH(int maKH) {
        this.maKH = maKH;
    }

    public String getDiaChiNhanHang() {
        return diaChiNhanHang;
    }

    public void setDiaChiNhanHang(String diaChiNhanHang) {
        this.diaChiNhanHang = diaChiNhanHang;
    }

    public LocalDateTime getNgayDatHang() {
        return ngayDatHang;
    }

    public void setNgayDatHang(LocalDateTime ngayDatHang) {
        this.ngayDatHang = ngayDatHang;
    }

    public LocalDateTime getNgayNhanHang() {
        return ngayNhanHang;
    }

    public void setNgayNhanHang(LocalDateTime ngayNhanHang) {
        this.ngayNhanHang = ngayNhanHang;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getThanhToan() {
        return thanhToan;
    }

    public void setThanhToan(String thanhToan) {
        this.thanhToan = thanhToan;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public double getPhiVanChuyen() {
        return phiVanChuyen;
    }

    public void setPhiVanChuyen(double phiVanChuyen) {
        this.phiVanChuyen = phiVanChuyen;
    }

    @Override
    public String toString() {
        return "DonHang{" +
                "maDH=" + maDH +
                ", maKH=" + maKH +
                ", diaChiNhanHang='" + diaChiNhanHang + '\'' +
                ", soDienThoai='" + soDienThoai + '\'' +
                ", ngayDatHang=" + ngayDatHang +
                ", ngayNhanHang=" + ngayNhanHang +
                ", trangThai='" + trangThai + '\'' +
                ", thanhToan='" + thanhToan + '\'' +
                '}';
    }

    @Override
    public String beforeValue() {
        return "{"
                + "maDH: "+ maDH + ","
                + "maKH: " + maKH + ","
                + "diaChiNhanHang: " + diaChiNhanHang + ","
                + "soDienThoai: " + soDienThoai + ","
                + "ngayDatHang: " + ngayDatHang + ","
                + "ngayNhanHang: " + ngayNhanHang + ","
                + "trangThai: " + trangThai + ","
                + "thanhToan: " + thanhToan + ","
                + "phiVanChuyen: " + phiVanChuyen
                + "}";
    }

    @Override
    public String afterValue() {
        return "{"
                + "maDH: "+ maDH + ","
                + "maKH: " + maKH + ","
                + "diaChiNhanHang: " + diaChiNhanHang + ","
                + "soDienThoai: " + soDienThoai + ","
                + "ngayDatHang: " + ngayDatHang + ","
                + "ngayNhanHang: " + ngayNhanHang + ","
                + "trangThai: " + trangThai + ","
                + "thanhToan: " + thanhToan + ","
                + "phiVanChuyen: " + phiVanChuyen
                + "}";
    }

    public String getTenKH() {
        return tenKH;
    }
}
