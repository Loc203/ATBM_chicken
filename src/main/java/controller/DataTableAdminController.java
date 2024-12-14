package controller;

import model.SanPham;

import javax.servlet.http.HttpServlet;
import java.awt.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class DataTableAdminController extends HttpServlet {
    // Replace these values with your actual database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/kfpchicken";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    // Method to add a new product
    public static void addProduct(String productID, String imagePath, String productName,
                                  String description, int amount, double price) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            // Assuming there's a sequence or auto-increment for the image ID
            int imageId = getImageId(imagePath, connection);

            String sql = "INSERT INTO sanpham (maSP, maAnh, tenSP, moTa, soLuongTonKho, giaGoc) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, productID);
                preparedStatement.setInt(2, imageId);
                preparedStatement.setString(3, productName);
                preparedStatement.setString(4, description);
                preparedStatement.setInt(5, amount);
                preparedStatement.setDouble(6, price);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to edit an existing product
    public static void editProduct(String productID, String imagePath, String productName,
                                   String description, int amount, double price) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            // Assuming there's a sequence or auto-increment for the image ID
            int imageId = getImageId(imagePath, connection);

            String sql = "UPDATE sanpham SET maAnh=?, tenSP=?, moTa=?, soLuongTonKho=?, giaGoc=? WHERE maSP=?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, imageId);
                preparedStatement.setString(2, productName);
                preparedStatement.setString(3, description);
                preparedStatement.setInt(4, amount);
                preparedStatement.setDouble(5, price);
                preparedStatement.setString(6, productID);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to delete a product
    public static void deleteProduct(String productID) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String sql = "DELETE FROM sanpham WHERE maSP=?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, productID);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // You may also want to retrieve the list of products from the database
    private static int getImageId(String imagePath, Connection connection) throws SQLException {
        String getImageIdSQL = "SELECT maAnh FROM anh WHERE duongDan=?";
        try (PreparedStatement getImageIdStatement = connection.prepareStatement(getImageIdSQL)) {
            getImageIdStatement.setString(1, imagePath);
            try (ResultSet resultSet = getImageIdStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("maAnh");
                }
            }
        }
        return -1; // Return a default value or handle accordingly
    }
}


