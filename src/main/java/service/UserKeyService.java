package service;

import dao.UserkeyDAO;
import entity.PublicKeyUser;

import java.sql.SQLException;
import java.util.List;

public class UserKeyService {
    private static UserKeyService instance;
    public static UserKeyService getInstance() {
        if (instance == null) instance = new UserKeyService();
        return instance;
    }
    public List<PublicKeyUser> findAllKey() throws SQLException {return UserkeyDAO.findAllKey();}

    public List<PublicKeyUser> findAllKeyByUserId(int userId) throws SQLException {return UserkeyDAO.findAllKeyByUserId(userId);}

    public PublicKeyUser findKeyActiveByUserId(int userId) throws SQLException {return UserkeyDAO.findKeyActiveByUserId(userId);}
}
