package service;

import dao.DonHangDAO;
import model.DonHang;

import java.time.LocalDateTime;
import java.util.Calendar;
import java.sql.Date;
import java.util.List;

public class DonHangService {
    private static DonHangService instance;

    public static DonHangService getInstance(){
        if (instance==null) instance = new DonHangService();
        return instance;
    }
    public List<DonHang> getAll(){ return DonHangDAO.getAll(); }
    public boolean addDonHang(DonHang donHang) {
        return DonHangDAO.addDonHang(donHang);
    }
    public boolean updateDonHang(DonHang donHang) {
        return DonHangDAO.updateDonHang(donHang);
    }
    public boolean deleteDonHang(DonHang donHang) {
        return DonHangDAO.deleteDonHang(donHang);
    }

    public List<DonHang> getDonHangBymaKH(int maKH) {return DonHangDAO.getDonHangBymaKH(maKH);}


    public boolean getDonHangById(int id){
        return DonHangDAO.getDonHangById(id);
    }
    public DonHang getOrderById(int id) { return DonHangDAO.getOrderById(id);}

    public static void main(String[] args) {
        DonHang donhang = DonHangService.getInstance().getOrderById(19331);
        System.out.println(donhang);
        //        DonHang donHang = new DonHang(0, "abc", LocalDateTime.now(), LocalDateTime.now(), "chưa giao", "COD");
//        int themDonHang = DonHangService.getInstance().insertDonHang(donHang);
//        System.out.println(themDonHang);
    }
}

