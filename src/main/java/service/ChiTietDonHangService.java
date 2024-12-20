package service;

import dao.ChiTietDonHangDAO;
import dao.DonHangDAO;
import entity.ElectronicSignature;
import model.ChiTiet_DonHang;
import model.DonHang;
import model.SanPham;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
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
     public static void main(String[] args) throws InvalidKeySpecException, NoSuchAlgorithmException, SignatureException, InvalidKeyException {
//        List<ChiTiet_DonHang> res = ChiTietDonHangService.getInstance().getAll();
         List<ChiTiet_DonHang> ctdh = ChiTietDonHangService.getCTDHByMaDH(19331);
         String ctdhString = ctdh.toString();
         System.out.println(ctdhString);

         DonHang dh = DonHangService.getInstance().getOrderById(19331);
         String key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsCn2na8ENB8Gd2/aeY8fyWWChqTg9RlB/ewRLlSE5o/x/WDswYtUmbOPomray2Fl2TWZJ6PPhk1pbO5Vtnpi6MGKrZ8Yw0EoS7/hR/RGFtncPdg6rgOUtyANL0XbVey589SmbC78hLyvtM6DE+DRh8YAIVfQ2b0W8qr7jr5+1asHLhyeJsdVnJz2zkyXZOCW9yDZzRF0lykzTHVJZtJaqITSb2UEfnjVFoiHcHCXTJss8E5mpBIsDBpwgBCacHQ2QtK5yd0IsV06FaKeCfA7DcLZMfNWPnGlxs1t/EMGVAsithAaYM4WWFS9/eUu5YAVxd8VSBlPtzw/HUuqb1uNXQIDAQAB";
         System.out.println(ElectronicSignature.checkSignature(key,ctdhString,dh.getSignature()));

    }
}
