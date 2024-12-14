package dao;

import db.JDBIConnector;
import entity.PublicKeyUser;
import java.sql.SQLException;
import java.util.List;

public class UserkeyDAO {
    public boolean saveKey(PublicKeyUser keyuser) throws SQLException {
        String query = "INSERT INTO userkey (user_id, publickey, isActive) VALUES (?,?,?)";
        int rowUpdated = 0;
        rowUpdated = JDBIConnector.me().withHandle(handle -> {
            return handle.createUpdate(query)
                    .bind(0, keyuser.getUser_id())
                    .bind(1, keyuser.getPublicKey())
                    .bind(2, keyuser.getIsActive())
                    .execute();
        });
        return rowUpdated > 0;
    }

    public boolean setInActive(int userId) {
        String query = "UPDATE userkey SET isActive= 0 WHERE user_id= ?";
        int rowUpdated = 0;
        rowUpdated = JDBIConnector.me().withHandle(handle -> {
            return handle.createUpdate(query)
                    .bind(0, userId)
                    .execute();
        });
        return rowUpdated > 0;
    }

    public boolean setActive(int userId) {
        String query = "UPDATE userkey SET isActive= 1 WHERE user_id= ?";
        int rowUpdated = 0;
        rowUpdated = JDBIConnector.me().withHandle(handle -> {
            return handle.createUpdate(query)
                    .bind(0, userId)
                    .execute();
        });
        return rowUpdated > 0;
    }

    public boolean checkIsActive(int userId){
        String query = "SELECT isActive from userkey where user_id =?";
        int isActive = JDBIConnector.me().withHandle(handle -> handle.createQuery(query)
                .bind(0, userId)
                .mapTo(Integer.class)
                .one());
        return isActive == 1;
    }

    public PublicKeyUser findKeyActiveByUserId(int userId) throws SQLException {
        String query = "SELECT * FROM userkey WHERE user_id = ? AND isActive =1 LIMIT 1";
        return JDBIConnector.me().withHandle(handle -> {
            return handle.createQuery(query)
                    .bind(0, userId)
                    .mapToBean(PublicKeyUser.class)
                    .findOne()
                    .orElse(null); // Nếu không tìm thấy, trả về null
        });
    }
    public List<PublicKeyUser> findAllKeyByUserId(int userId) throws SQLException {
        String query = "SELECT * FROM userkey WHERE user_id = ?";
        List<PublicKeyUser> keyUsers = JDBIConnector.me().withHandle(handle -> {
            return handle.createQuery(query)
                    .bind(0, userId)
                    .mapToBean(PublicKeyUser.class)
                    .list();
        });
        return keyUsers.isEmpty() ? null : keyUsers;
    }

    public List<PublicKeyUser> findAllKey() throws SQLException {
        String query = "SELECT * FROM userkey";
        List<PublicKeyUser> keyUsers = JDBIConnector.me().withHandle(handle -> {
            return handle.createQuery(query)
                    .mapToBean(PublicKeyUser.class)
                    .list();
        });
        return keyUsers.isEmpty() ? null : keyUsers;
    }


    public static void main(String[] args) throws SQLException {
        UserkeyDAO userkeyDAO = new UserkeyDAO();
//        userkeyDAO.setActive(133);
//        System.out.println(userkeyDAO.checkIsActive(133));
        System.out.println(userkeyDAO.findAllKey());
    }

}
