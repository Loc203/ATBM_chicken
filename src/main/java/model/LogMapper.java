package model;

import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class LogMapper implements RowMapper<Log> {
    @Override
    public Log map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Log(
                rs.getInt("id"),
                LogLevels.valueOf(rs.getString("logLevels")), // Assuming LogLevels is an enum
                rs.getString("ip"),
                rs.getString("address"),
                rs.getString("beforeValue"),
                rs.getString("afterValue"),
                rs.getObject("createAt", LocalDateTime.class)
        );
    }
}