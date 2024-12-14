package service;

import dao.KhachHangDAO;
import db.JDBIConnector;
import model.KhachHang;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class KhachHangService {
    static Map<String, String> data = new HashMap<>();
    static {
        data.put("abc@gmail.com", "123");
        data.put("ti@gmail.com", "123");
    }

    private static KhachHangService instance;

    public static KhachHangService getInstance(){
        if (instance==null) instance = new KhachHangService();
        return instance;
    }
    public List<KhachHang> getAll(){return KhachHangDAO.getAll();}
    public boolean addKhachHang(KhachHang kh){
        return KhachHangDAO.addKhachHang(kh);
    }
    public boolean updateKhachHang(KhachHang kh){
        return KhachHangDAO.updateKhachHang(kh);
    }
    public boolean deleteKhachHang(KhachHang kh){
        return KhachHangDAO.deleteKhachHang(kh);
    }
    public KhachHang getKhachHangById(int id) { return KhachHangDAO.getKhachHangById(id);}

    public KhachHang checkLogin(String email, String matKhau){
        KhachHang khachHangByEmail = KhachHangDAO.getKhachHangByEmail(email);
        if (khachHangByEmail==null) return null;
        if(!khachHangByEmail.getEmail().equals(email)||khachHangByEmail.getMatKhau().equals(matKhau)) return null;
        return khachHangByEmail;
    }


    public static void main(String[] args) {
//         List<KhachHang> khachHangs = JDBIConnector.me().withHandle((handle -> {
//            return handle.createQuery("select * from khachhang").mapToBean(KhachHang.class).collect(Collectors.toList()
//            );
//        }));
//        System.out.println(khachHangs);
        KhachHang kh = new KhachHang(2, "Lâm Hồng Phúc", "21130477@st.hcmuaf.edu.vn","123", "123456789", "Nam", Date.valueOf("2003-01-01"), null, 5);
        boolean editKH= KhachHangService.getInstance().updateKhachHang(kh);
        System.out.println(editKH);
    }
}
