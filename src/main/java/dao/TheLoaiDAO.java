package dao;

import db.JDBIConnector;
import model.TheLoai;

import java.util.List;
import java.util.stream.Collectors;

public class TheLoaiDAO {

    public static List<TheLoai> getAll(){
        List<TheLoai> theLoais = JDBIConnector.me().withHandle((handle ->
                handle.createQuery("select * from theloai")
                        .mapToBean(TheLoai.class)
                        .stream()
                        .collect(Collectors.toList())
        ));
        return theLoais;
    }
}
