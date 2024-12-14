package dao;

import db.JDBIConnector;
import model.Anh;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Update;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class AnhDAO {

    public static List<Anh> getAll() {
        String sql = "SELECT * FROM Anh";
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery(sql)
                        .map((rs, ctx) -> {
                            Anh anh = new Anh();
                            anh.setMaAnh(rs.getInt("maAnh"));
                            anh.setMaSP(rs.getInt("maSP"));
                            anh.setDuongDan(rs.getString("duongDan"));
                            anh.setChuThich(rs.getString("chuThich"));
                            return anh;
                        }).list()
        );
    }

    public static boolean addImage(int maAnh, String duongDan) {
        String sql = "INSERT INTO Anh (maAnh, duongDan) VALUES (:maAnh, :duongDan)";
        int affectedRows = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("maAnh", maAnh)
                        .bind("duongDan", duongDan)
                        .execute()
        );
        return affectedRows > 0;
    }

    public static Anh getImageById(int maAnh) {
        String sql = "SELECT * FROM Anh WHERE maAnh = :maAnh";
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("maAnh", maAnh)
                        .mapToBean(Anh.class)
                        .findOne()
                        .orElse(null)
        );
    }
}

