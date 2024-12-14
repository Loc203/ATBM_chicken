package Cart;

import model.SanPham;

public class GioHangSanPham {
    private int soLuong;
    private SanPham sp;

    public GioHangSanPham() {
    }

    public GioHangSanPham(int soLuong, SanPham sp) {
        this.soLuong = soLuong;
        this.sp = sp;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public SanPham getSp() {
        return sp;
    }

    public void setSp(SanPham sp) {
        this.sp = sp;
    }

    public void tangSoLuong(int soLuong) {
        this.soLuong+=soLuong;
    }

    public void giamSoLuong(int soLuong) {
        this.soLuong-=soLuong;
        if (this.soLuong <= 0) this.soLuong += soLuong;
    }

    public double tongGiaTri(){
        double kq = 0;
        if (sp.getGiaGiam() == 0){
            kq+= soLuong * sp.getGiaGoc();
        } else {
            kq += soLuong * sp.getGiaGiam();
        }
        return kq;
    }

}
