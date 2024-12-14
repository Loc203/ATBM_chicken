package model;

import java.io.Serializable;
import java.util.List;

public class ChiTiet_DonHang implements Serializable {

    private int maDH;

    private int maSP;

    private int soLuongDatHang;

    private double thanhTien;

    private List<Integer> dsMaSP;

    private List<Integer> dsSoLuongDatHang;

    private double thueVAT;

    private double tongTien;



    private SanPham sanpham;

    public ChiTiet_DonHang() {
    }
    public ChiTiet_DonHang(int maDH, List<Integer> dsMaSP, List<Integer> dsSoLuongDatHang, double thueVAT, double tongTien, SanPham sanpham) {
        this.maDH = maDH;
        this.dsMaSP = dsMaSP;
        this.dsSoLuongDatHang = dsSoLuongDatHang;
        this.thueVAT = thueVAT;
        this.tongTien = tongTien;
        this.sanpham = sanpham;
    }

    public ChiTiet_DonHang(int maDH, List<Integer> dsMaSP, List<Integer> dsSoLuongDatHang, double thueVAT, double tongTien) {
        this.maDH = maDH;
        this.dsMaSP = dsMaSP;
        this.dsSoLuongDatHang = dsSoLuongDatHang;
        this.thueVAT = thueVAT;
        this.tongTien = tongTien;
    }

    public ChiTiet_DonHang(int maDH) {
        this.maDH = maDH;
    }

    public int getMaDH() {
        return maDH;
    }

    public void setMaDH(int maDH) {
        this.maDH = maDH;
    }

    public List<Integer> getDsMaSP() {
        return dsMaSP;
    }

    public void setDsMaSP(List<Integer> dsMaSP) {
        this.dsMaSP = dsMaSP;
    }

    public List<Integer> getDsSoLuongDatHang() {
        return dsSoLuongDatHang;
    }

    public void setDsSoLuongDatHang(List<Integer> dsSoLuongDatHang) {
        this.dsSoLuongDatHang = dsSoLuongDatHang;
    }

    public double getThueVAT() {
        return thueVAT;
    }

    public void setThueVAT(double thueVAT) {
        this.thueVAT = thueVAT;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    public int getMaSP() {
        return maSP;
    }

    public void setMaSP(int maSP) {
        this.maSP = maSP;
    }

    public int getSoLuongDatHang() {
        return soLuongDatHang;
    }

    public void setSoLuongDatHang(int soLuongDatHang) {
        this.soLuongDatHang = soLuongDatHang;
    }

    public double getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(double thanhTien) {
        this.thanhTien = thanhTien;
    }

    public String printDsMaSP(){
        String res = "";
        for (int maSP: dsMaSP) {
            res += maSP + " ";
        }
        return res;
    }

    public String printDsSoLuongDatHang(){
        String res = "";
        for (int sldh: dsSoLuongDatHang) {
            res += sldh + " ";
        }
        return res;
    }

    @Override
    public String toString() {
        return "ChiTiet_DonHang{" +
                "maDH=" + maDH +
                ", dsMaSP=" + printDsMaSP() +
                ", soLuongDatHang=" + printDsSoLuongDatHang() +
                ", thueVAT=" + thueVAT +
                ", tongTien=" + tongTien +
                ", sanpham=" + sanpham.toShortString() +
                '}';
    }

    public SanPham getSanPham() {
        return sanpham;
    }
    public void setSanPham(SanPham sanpham) {
        this.sanpham = sanpham;
    }
}
