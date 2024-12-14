package service;

import dao.LogDAO;
import model.KhachHang;
import model.Log;
import model.LogLevels;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

public class LogService {
    private static LogService instance;

    public static LogService getInstance() {
        if (instance == null) instance = new LogService();
        return instance;
    }

    public int addLog(Log log) {
        return LogDAO.addLog(log);
    }

    public List<Log> getAll() {
        return LogDAO.getAll();
    }

    public static void main(String[] args) {
        KhachHang kh = new KhachHang(1, "Tri Nguyen", "abc@gmail.com", "0423685741", "Nam", Date.valueOf("2003-01-01"));
//        Log log = new Log();
//        log.setLogLevels(LogLevels.INFO);
//        log.setAddress("user");
//        log.setBeforeValue("null");
//        log.setAfterValue(kh.beforeValue());
//        log.setIp("127.0.0.1");
//        log.setCreateAt(LocalDateTime.now());
//        boolean addKH = KhachHangService.getInstance().addKhachHang(kh);
//        int addLog = LogService.getInstance().addLog(log);
//        System.out.println(addKH);
//        System.out.println(addLog);
        List<Log> logs = LogService.getInstance().getAll();
        System.out.println(logs);
    }
}
