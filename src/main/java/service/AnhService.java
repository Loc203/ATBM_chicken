package service;

import model.Anh;
import dao.AnhDAO;

import java.io.InputStream;
import java.util.List;

public class AnhService {
    private static AnhService instance;

    public static AnhService getInstance() {
        if (instance == null) instance = new AnhService();
        return instance;
    }

    public List<Anh> getAll() {
        return AnhDAO.getAll();
    }

    public boolean addImage(int maAnh, String duongDan) {
        return AnhDAO.addImage(maAnh, duongDan);
    }

    public Anh getImageById(int maAnh) {
        return AnhDAO.getImageById(maAnh);
    }
    public static void main(String[] args) {

    }
}
