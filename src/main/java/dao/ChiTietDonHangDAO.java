package dao;

import db.JDBIConnector;
import model.ChiTiet_DonHang;
import model.SanPham;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class ChiTietDonHangDAO {
    public static List<ChiTiet_DonHang> getAll() {
        String sql = "SELECT maDH, maSP, soLuongDatHang, thueVAT, tongTien FROM chitiet_donhang";

        return JDBIConnector.me().withHandle(handle ->
                        handle.createQuery(sql)
                                .map((rs, ctx) -> {
                                    int maDH = rs.getInt("maDH");
                                    int maSP = rs.getInt("maSP");
                                    int soLuongDatHang = rs.getInt("soLuongDatHang");
                                    double thueVAT = rs.getDouble("thueVAT");
                                    double tongTien = rs.getDouble("tongTien");

                                    List<Integer> dsMaSP = new ArrayList<>(Collections.singletonList(maSP));
                                    List<Integer> dsSoLuongDatHang = new ArrayList<>(Collections.singletonList(soLuongDatHang));

                                    return new ChiTiet_DonHang(maDH, dsMaSP, dsSoLuongDatHang, thueVAT, tongTien);
                                })
                                .list()
                ).stream()
                .collect(
                        Collectors.toMap(
                                ChiTiet_DonHang::getMaDH,
                                ctdh -> ctdh,
                                (ctdh1, ctdh2) -> {
                                    ctdh1.getDsMaSP().addAll(ctdh2.getDsMaSP());
                                    ctdh1.getDsSoLuongDatHang().addAll(ctdh2.getDsSoLuongDatHang());
                                    ctdh1.setTongTien(ctdh1.getTongTien() + ctdh2.getTongTien());
                                    return ctdh1;
                                }
                        )
                )
                .values()
                .stream()
                .toList();
    }

    public static List<SanPham> getTop6SanPham() {
        String sql = "SELECT maSP, SUM(soLuongDatHang) as tongSoLuong FROM chitiet_donhang GROUP BY maSP ORDER BY tongSoLuong DESC LIMIT 6";

        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery(sql)
                        .map((rs, ctx) -> {
                            int maSP = rs.getInt("maSP");
                            int tongSoLuong = rs.getInt("tongSoLuong");
                            return new SanPham(maSP, tongSoLuong);
                        })
                        .list()
        );
    }

    public static int addCTDH(ChiTiet_DonHang ctdh) {
        String sql = "insert into chitiet_donhang values(?,?,?,?,?)";

        return JDBIConnector.me().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind(0, ctdh.getMaDH())
                        .bind(1, ctdh.getMaSP())
                        .bind(2, ctdh.getSoLuongDatHang())
                        .bind(3, ctdh.getThueVAT())
                        .bind(4, ctdh.getThanhTien())
                        .execute());
    }

    public static int updateCTDH(ChiTiet_DonHang ctdh) {
        return 0;
    }

    public static int deleteCTDH(ChiTiet_DonHang ctdh) {
        return 0;
    }

    public static List<ChiTiet_DonHang> getCTDHByMaDH(int maDH) {
        String sql = "SELECT ctdh.maSP, sp.tenSP, sp.giaGoc, sp.giaGiam, ctdh.soLuongDatHang, ctdh.thueVAT, ctdh.tongTien" +
                " FROM chitiet_donhang ctdh JOIN sanpham sp" +
                " ON ctdh.maSP = sp.maSP WHERE ctdh.maDH = ?";
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery(sql)
                        .bind(0, maDH)
                        .map((rs, ctx) -> {
                            int maSP = rs.getInt("maSP");
                            int soLuongDatHang = rs.getInt("soLuongDatHang");
                            double thueVAT = rs.getDouble("thueVAT");
                            double tongTien = rs.getDouble("tongTien");

                            List<Integer> dsMaSP = new ArrayList<>(Collections.singletonList(maSP));
                            List<Integer> dsSoLuongDatHang = new ArrayList<>(Collections.singletonList(soLuongDatHang));

                            String tenSP = rs.getString("tenSP");
                            double giaGoc = rs.getDouble("giaGoc");
                            double giaGiam = rs.getDouble("giaGiam");
                            SanPham sp = new SanPham(tenSP, giaGoc, giaGiam);

                            return new ChiTiet_DonHang(maDH, dsMaSP, dsSoLuongDatHang, thueVAT, tongTien, sp);
                        })
                        .list()
        );
    }

    public static void main(String[] args) {
        System.out.println(ChiTietDonHangDAO.getCTDHByMaDH(49556));
    }
}
