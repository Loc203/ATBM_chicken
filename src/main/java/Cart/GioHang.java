package Cart;

import model.SanPham;
import service.SanPhamService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GioHang {
    Map<Integer, GioHangSanPham> data = new HashMap<Integer, GioHangSanPham>();

    public boolean add(int maSP){
        return add(maSP, 1);
    }

    public boolean add(int maSP, int soLuong){
        SanPham sp = SanPhamService.getInstance().getSanPhamById(maSP);
        if (sp == null) return false;

        int tonKho = sp.getSoLuongTonKho();
        int soLuongHienTai = data.containsKey(maSP) ? data.get(maSP).getSoLuong() : 0;

        if (soLuongHienTai + soLuong > tonKho) {
            return false;
        }

        GioHangSanPham ghsp = null;
        if (data.containsKey(maSP)) {
            ghsp = data.get(maSP);
            ghsp.tangSoLuong(soLuong);
        } else {
            ghsp = new GioHangSanPham(soLuong,sp);
        }
        data.put(maSP, ghsp);
        return true;
    }

    public boolean decrease(int maSP) {
        return decrease(maSP, 1);
    }

    public boolean decrease(int maSP, int soLuong) {
        if (data.containsKey(maSP)) {
            GioHangSanPham ghsp = data.get(maSP);
            ghsp.giamSoLuong(soLuong);
            if (ghsp.getSoLuong() <= 0) {
                // Nếu số lượng giảm xuống dưới hoặc bằng 0, xóa sản phẩm khỏi giỏ hàng
                data.remove(maSP);
            }
            return true;
        }
        return false;
    }

    public int getToTal(){
        return data.size();
    }

    public List<GioHangSanPham> getDanhSachSanPham() {
        return new ArrayList<>(data.values());
    }

    public GioHangSanPham remove(int maSP) {
        return data.remove(maSP);
    }

    public void clear() {
        data.clear();
    }

}

