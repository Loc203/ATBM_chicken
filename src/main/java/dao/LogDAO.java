package dao;

import db.JDBIConnector;
import model.Log;
import model.LogMapper;

import java.util.List;

public class LogDAO {

    public static int addLog(Log log) {
        String sql = "insert into log (level, ip, address, beforeValue, afterValue, createAt)" +
                "values(?,?,?,?,?,?)";
        return JDBIConnector.me().withHandle(handle -> handle
                .createUpdate(sql)
                .bind(0,log.getLogLevels().toString())
                .bind(1,log.getIp())
                .bind(2,log.getAddress())
                .bind(3,log.getBeforeValue())
                .bind(4,log.getAfterValue())
                .bind(5,log.getCreateAt())
                .execute()
        );
    }

    public static List<Log> getAll() {
        String sql = "SELECT id, level AS logLevels, ip, address, beforeValue, afterValue, createAt FROM log";
        return JDBIConnector.me().withHandle(handle ->
                handle.createQuery(sql)
                        .map(new LogMapper())
                        .list());
    }
}
