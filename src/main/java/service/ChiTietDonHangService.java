package service;

import dao.ChiTietDonHangDAO;
import model.ChiTiet_DonHang;
import model.SanPham;

import java.util.List;

public class ChiTietDonHangService {
    private static ChiTietDonHangService instance;

    public static ChiTietDonHangService getInstance(){
        if (instance==null) instance = new ChiTietDonHangService();
        return instance;
    }
    public List<ChiTiet_DonHang> getAll(){
        return ChiTietDonHangDAO.getAll();
    }

    public List<SanPham> getTop6SanPham(){
        return ChiTietDonHangDAO.getTop6SanPham();
    }

    public int addCTDH(ChiTiet_DonHang ctdh){ return ChiTietDonHangDAO.addCTDH(ctdh);}

    public int updateCTDH(ChiTiet_DonHang ctdh) {return ChiTietDonHangDAO.updateCTDH(ctdh);}

    public int deleteCTDH(ChiTiet_DonHang ctdh) {return ChiTietDonHangDAO.deleteCTDH(ctdh);}

    public static List<ChiTiet_DonHang> getCTDHByMaDH(int maDH){return ChiTietDonHangDAO.getCTDHByMaDH(maDH);}
     public static void main(String[] args) {
//        List<ChiTiet_DonHang> res = ChiTietDonHangService.getInstance().getAll();
         List<ChiTiet_DonHang> ctdh = ChiTietDonHangService.getCTDHByMaDH(2);
        System.out.println(ctdh);
    }
}
