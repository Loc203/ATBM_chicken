package service;

import dao.SanPhamDAO;
import model.Anh;
import model.SanPham;
import model.TheLoai;

import java.sql.SQLException;
import java.util.List;

public class SanPhamService {
    private static SanPhamService instance;

    public static SanPhamService getInstance(){
        if (instance==null) instance = new SanPhamService();
        return instance;
    }

    public List<SanPham> getAll(){
        return SanPhamDAO.getAll();
    }

    public List<SanPham> getAllById(int id){
        return SanPhamDAO.getAllById(id);
    }

    public SanPham getSanPhamById(int id) {
        return SanPhamDAO.getSanPhamById(id);
    }

    public boolean addProduct(SanPham sanpham){ return SanPhamDAO.addProduct(sanpham);}

    public boolean updateProduct(SanPham sanpham){ return SanPhamDAO.updateProduct(sanpham);}

    public boolean deleteProduct(SanPham sanpham){ return SanPhamDAO.deleteProduct(sanpham);}

    public boolean checkSanPhamByID(int id){ return SanPhamDAO.checkSanPhamByID(id);}

    public static void main(String[] args) throws SQLException {
//       SanPham sp = new SanPham(50, "abc", 233, 23, "abc", 49);
//        boolean update = SanPhamService.getInstance().updateProduct(sp);
//        System.out.println(update);
        SanPham sp = SanPhamService.getInstance().getSanPhamById(2);
        System.out.println(sp);



    }

}
