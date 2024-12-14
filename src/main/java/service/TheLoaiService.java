package service;

import dao.SanPhamDAO;
import dao.TheLoaiDAO;
import model.SanPham;
import model.TheLoai;

import java.util.List;

public class TheLoaiService {
    private static TheLoaiService instance;

    public static TheLoaiService getInstance(){
        if (instance==null) instance = new TheLoaiService();
        return instance;
    }

    public List<TheLoai> allTL(){
        return TheLoaiDAO.getAll();
    }

}
