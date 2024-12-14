package dao;

import db.JDBIConnector;
import model.NguyenLieu;

import java.util.List;

public class NguyenLieuDAO {

    public static List<NguyenLieu> getAll() {
        String query = "select * from nguyenlieu";
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery(query)
                        .mapToBean(NguyenLieu.class).list());
    }

    public static int addNguyenLieu(NguyenLieu nl) {
        String query = "insert into nguyenlieu (nguyenlieu, soluong, noidung, loai, thoigian, donvi, gia, tong) values(?,?,?,?,?,?,?,?)";
        double tong = nl.getSoluong() * nl.getGia();
        return JDBIConnector.me().withHandle(handle ->
                handle.createUpdate(query)
                        .bind(0, nl.getNguyenlieu())
                        .bind(1, nl.getSoluong())
                        .bind(2, nl.getNoidung())
                        .bind(3, nl.getLoai())
                        .bind(4, nl.getThoigian())
                        .bind(5, nl.getDonvi())
                        .bind(6, nl.getGia())
                        .bind(7, tong)
                        .execute());
    }
}
