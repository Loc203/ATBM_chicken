package service;


import dao.NguyenLieuDAO;
import model.NguyenLieu;

import java.util.List;

public class NguyenLieuService {
    private static NguyenLieuService instance;

    public static NguyenLieuService getInstance() {
        if (instance == null) instance = new NguyenLieuService();
        return instance;
    }

    public int addNguyenLieu(NguyenLieu nguyenLieu) {
        return NguyenLieuDAO.addNguyenLieu(nguyenLieu);
    }

    public List<NguyenLieu> getAll() {
        return NguyenLieuDAO.getAll();
    }

}
