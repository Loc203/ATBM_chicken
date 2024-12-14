package dao;

import com.mysql.cj.protocol.a.LocalDateTimeValueEncoder;
import db.JDBIConnector;
import model.*;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.mapper.reflect.ConstructorMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


public class DonHangDAO {

    private static Jdbi JDBI;

    public static List<DonHang> getAll() {
        String query = "SELECT dh.maDH, dh.maKH, kh.tenKH, dh.diaChiNhanHang, dh.soDienThoai, " +
                "dh.ngayDatHang, dh.ngayNhanHang, dh.trangThai, dh.thanhToan, dh.phiVanChuyen " +
                "FROM donhang dh " +
                "JOIN khachhang kh ON dh.maKH = kh.maKH";

        List<DonHang> donhangs = new ArrayList<>();
        try {
            donhangs = JDBIConnector.me().withHandle(handle ->
                    handle.createQuery(query)
                            .map((rs, ctx) -> {
                                int maDH = rs.getInt("maDH");
                                int maKH = rs.getInt("maKH");
                                String tenKH = rs.getString("tenKH"); // Retrieve tenKH
                                String diaChiNhanHang = rs.getString("diaChiNhanHang");
                                String soDienThoai = rs.getString("soDienThoai");
                                LocalDateTime ngayDatHang = rs.getTimestamp("ngayDatHang").toLocalDateTime();
                                LocalDateTime ngayNhanHang = rs.getTimestamp("ngayNhanHang").toLocalDateTime();
                                String trangThai = rs.getString("trangThai");
                                String thanhToan = rs.getString("thanhToan");
                                double phiVanChuyen = rs.getDouble("phiVanChuyen");

                                return new DonHang(maDH,maKH, diaChiNhanHang, soDienThoai,
                                        ngayDatHang, ngayNhanHang, trangThai, thanhToan,tenKH, phiVanChuyen);
                            }).list());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return donhangs;
    }

    public static boolean getDonHangById(int id) {
        String sql = "SELECT maDH, maKH, diaChiNhanHang, soDienThoai, ngayDatHang, ngayNhanHang, trangThai, thanhToan FROM donhang WHERE maDH = ?";

        try {
            Optional<DonHang> donHang = JDBIConnector.me().withHandle(handle ->
                    handle.createQuery(sql)
                            .bind(0, id)
                            .mapToBean(DonHang.class)
                            .findOne()
            );

            return donHang.isPresent();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }



    public static boolean addDonHang(DonHang donHang) {
        String sql = "insert into donhang values(?,?,?,?,?,?,?,?,?)";

        try {
            int res = JDBIConnector.me().withHandle(handle ->
                    handle.createUpdate(sql)
                            .bind(0, donHang.getMaDH())
                            .bind(1, donHang.getMaKH())
                            .bind(2, donHang.getDiaChiNhanHang())
                            .bind(3, donHang.getSoDienThoai())
                            .bind(4, donHang.getNgayDatHang())
                            .bind(5, donHang.getNgayNhanHang())
                            .bind(6, donHang.getTrangThai())
                            .bind(7, donHang.getThanhToan())
                            .bind(8, donHang.getPhiVanChuyen())
                            .execute()
            );
            return res > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean updateDonHang(DonHang donHang) {
        String updateQuery = "UPDATE donhang SET maKH = ?, diaChiNhanHang = ?, ngayNhanHang = ?, trangThai = ?, thanhToan = ? WHERE maDH = ?";

        try {
            int rowsAffected = JDBIConnector.me().withHandle(handle ->
                    handle.createUpdate(updateQuery)
                            .bind(5, donHang.getMaDH())
                            .bind(0, donHang.getMaKH())
                            .bind(1, donHang.getDiaChiNhanHang())
                            .bind(2, donHang.getNgayNhanHang())
                            .bind(3, donHang.getTrangThai())
                            .bind(4, donHang.getThanhToan())
                            .execute()
            );

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static boolean deleteDonHang(DonHang donHang) {
        String deleteQuery = "DELETE FROM donhang WHERE maDH = ?";

        try {
            int rowsAffected = JDBIConnector.me().withHandle(handle ->
                    handle.createUpdate(deleteQuery)
                            .bind(0, donHang.getMaDH())
                            .execute()
            );

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Phương thức để chèn một DonHang mới vào cơ sở dữ liệu ( cho việc thanh toán )
    public static int insertDonHang(DonHang donHang) {
        String sql = "insert into donhang (maKH, diaChiNhanHang, ngayDatHang, ngayNhanHang, trangThai, thanhToan)" +
                "values(?,?,?,?,?,?)";
        int res = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind(0, donHang.getMaKH())
                        .bind(1, donHang.getDiaChiNhanHang())
                        .bind(2, donHang.getNgayDatHang())
                        .bind(3, donHang.getNgayNhanHang())
                        .bind(4, donHang.getTrangThai())
                        .bind(5, donHang.getThanhToan())
                        .execute()
        );
        return res;
    }
    public static List<DonHang> getDonHangBymaKH(int maKH) {
        String sql = "SELECT maDH, maKH, diaChiNhanHang, soDienThoai, ngayDatHang, ngayNhanHang, trangThai, thanhToan, phiVanChuyen FROM donhang WHERE maKH = ?";

        try {
            List<DonHang> donHangList = JDBIConnector.me().withHandle(handle ->
                    handle.createQuery(sql)
                            .bind(0, maKH)
                            .mapToBean(DonHang.class)
                            .list()
            );

            return donHangList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static DonHang getOrderById(int id) {
        String sql = "SELECT maDH, maKH, diaChiNhanHang, ngayDatHang, ngayNhanHang, trangThai, thanhToan, phiVanChuyen FROM donhang WHERE maDH = ?";

        try {
            Optional<DonHang> optionalDonHang = JDBIConnector.me().withHandle(handle ->
                    handle.createQuery(sql)
                            .bind(0, id)
                            .mapToBean(DonHang.class)
                            .findOne()
            );

            return optionalDonHang.orElse(null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}


