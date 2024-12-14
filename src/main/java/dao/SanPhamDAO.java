package dao;

import db.JDBIConnector;
import model.Anh;
import model.KhachHang;
import model.SanPham;
import model.TheLoai;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.mapper.reflect.ConstructorMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class SanPhamDAO {

    public static List<SanPham> getAll() {
        String query = "SELECT sp.maSP, sp.tenSP, sp.giaGoc, sp.giaGiam, sp.soLuongTonKho, sp.moTa, " +
                "tl.maTL, tl.tenTL, a.maAnh, a.duongDan FROM sanpham sp " +
                "JOIN anh a ON sp.maAnh = a.maAnh " +
                "JOIN theloai tl ON sp.maTL = tl.maTL";

        List<SanPham> sanPhams = new ArrayList<>();

        try {
            sanPhams = JDBIConnector.me().withHandle(handle ->
                    handle.createQuery(query)
                            .map((rs, ctx) -> {
                                int maSP = rs.getInt("maSP");
                                String tenSP = rs.getString("tenSP");
                                double giaGoc = rs.getDouble("giaGoc");
                                double giaGiam = rs.getDouble("giaGiam");
                                int soLuongTonKho = rs.getInt("soLuongTonKho");
                                String moTa = rs.getString("moTa");

                                int maTL = rs.getInt("maTL");
                                String tenTL = rs.getString("tenTL");
                                TheLoai theLoai = new TheLoai(maTL, tenTL);

                                int maAnh = rs.getInt("maAnh");
                                String duongDan = rs.getString("duongDan");
                                Anh anh = new Anh(maAnh, duongDan);

                                return new SanPham(maSP, tenSP, giaGoc, giaGiam, soLuongTonKho, moTa, theLoai, anh);
                            })
                            .list()
            );
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sanPhams;
    }


    public static List<SanPham> getAllById(int id) {
        String query = "SELECT sp.maSP, sp.tenSP, sp.giaGoc, sp.giaGiam, sp.soLuongTonKho, sp.moTa, " +
                "tl.maTL, tl.tenTL, a.maAnh, a.duongDan FROM sanpham sp " +
                "JOIN anh a ON sp.maAnh = a.maAnh " +
                "JOIN theloai tl ON sp.maTL = tl.maTL " +
                "where tl.maTL = ?";

        List<SanPham> sanPhams = new ArrayList<>();

        try {
            sanPhams = JDBIConnector.me().withHandle(handle ->
                    handle.createQuery(query).bind(0, id)
                            .map((rs, ctx) -> {
                                int maSP = rs.getInt("maSP");
                                String tenSP = rs.getString("tenSP");
                                double giaGoc = rs.getDouble("giaGoc");
                                double giaGiam = rs.getDouble("giaGiam");
                                int soLuongTonKho = rs.getInt("soLuongTonKho");
                                String moTa = rs.getString("moTa");

                                int maTL = rs.getInt("maTL");
                                String tenTL = rs.getString("tenTL");
                                TheLoai theLoai = new TheLoai(maTL, tenTL);

                                int maAnh = rs.getInt("maAnh");
                                String duongDan = rs.getString("duongDan");
                                Anh anh = new Anh(maAnh, duongDan);

                                return new SanPham(maSP, tenSP, giaGoc, giaGiam, soLuongTonKho, moTa, theLoai, anh);
                            })
                            .list()
            );
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sanPhams;
    }

    public static SanPham getSanPhamById(int id) {
        String query = "SELECT sp.maSP, sp.tenSP, sp.giaGoc, sp.giaGiam, sp.soLuongTonKho, sp.moTa, " +
                "tl.maTL, tl.tenTL, a.maAnh, a.duongDan FROM sanpham sp " +
                "JOIN anh a ON sp.maAnh = a.maAnh " +
                "JOIN theloai tl ON sp.maTL = tl.maTL " +
                "WHERE sp.maSP = ?";

        try {
            return JDBIConnector.me().withHandle(handle ->
                    handle.createQuery(query).bind(0, id)
                            .map((rs, ctx) -> {
                                int maSP = rs.getInt("maSP");
                                String tenSP = rs.getString("tenSP");
                                double giaGoc = rs.getDouble("giaGoc");
                                double giaGiam = rs.getDouble("giaGiam");
                                int soLuongTonKho = rs.getInt("soLuongTonKho");
                                String moTa = rs.getString("moTa");

                                int maTL = rs.getInt("maTL");
                                String tenTL = rs.getString("tenTL");
                                TheLoai theLoai = new TheLoai(maTL, tenTL);

                                int maAnh = rs.getInt("maAnh");
                                String duongDan = rs.getString("duongDan");
                                Anh anh = new Anh(maAnh, duongDan);

                                return new SanPham(maSP, tenSP, giaGoc, giaGiam, soLuongTonKho, moTa, theLoai, anh);
                            })
                            .findOne()
                            .orElse(null)
            );
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    public static boolean checkSanPhamByID(int id){
        String query = "Select maSP from sanpham WHERE maSP = ?";
        int re = JDBIConnector.me().withHandle(handle -> handle.createUpdate(query).bind(0,String.valueOf(id)).execute());
        return re > 0;
    }

    public static boolean addProduct(SanPham sanPham) {
        String insertQuery = "INSERT INTO sanpham (maSP, tenSP, giaGoc, giaGiam, soLuongTonKho, moTa, maTL, maAnh) " +
                "VALUES (?, ?, ?, 0, ?, ?, 0, ?)";

        try {
            int rowsAffected = JDBIConnector.me().withHandle(handle ->
                    handle.createUpdate(insertQuery)
                            .bind(0, sanPham.getMaSP())
                            .bind(1, sanPham.getTenSP())
                            .bind(2, sanPham.getGiaGoc())
                            .bind(3, sanPham.getSoLuongTonKho())
                            .bind(4, sanPham.getMoTa())
                            .bind(5, sanPham.getAnh().getMaAnh())


                            .execute()
            );

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static boolean updateProduct(SanPham sanPham) {
        String updateQuery = "UPDATE sanpham SET tenSP = ?, giaGoc = ?, soLuongTonKho = ?, moTa = ?, maAnh = ? WHERE maSP = ?";

        try {
            int rowsAffected = JDBIConnector.me().withHandle(handle ->
                    handle.createUpdate(updateQuery)
                            .bind(0, sanPham.getTenSP())
                            .bind(1, sanPham.getGiaGoc())
                            .bind(2, sanPham.getSoLuongTonKho())
                            .bind(3, sanPham.getMoTa())
                            .bind(4, sanPham.getAnh().getMaAnh())
                            .bind(5, sanPham.getMaSP())
                            .execute()
            );

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static boolean deleteProduct(SanPham sanPham) {
        String deleteQuery = "DELETE FROM sanpham WHERE maSP = ?";

        try {
            int rowsAffected = JDBIConnector.me().withHandle(handle ->
                    handle.createUpdate(deleteQuery)
                            .bind(0, sanPham.getMaSP())
                            .execute()
            );

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}