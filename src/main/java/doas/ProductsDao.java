package doas;

import models.*;
import util.*;
import java.sql.*;
import java.util.*;
import com.mysql.cj.jdbc.Driver;

public class ProductsDao implements Products {

    private Connection connection;

    public ProductsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database.", e);
        }
    }

    @Override
    public List<Product> all() {
        List<Product> products = new ArrayList();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM products");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                products.add(new Product(
                        rs.getLong("id"),
                        rs.getLong("item_id"),
                        rs.getLong("color_id"),
                        rs.getDouble("height"),
                        rs.getDouble("width"),
                        rs.getDouble("length"),
                        rs.getString("dimension_unit"),
                        rs.getDouble("weight"),
                        rs.getString("weight_unit"),
                        rs.getString("description"),
                        rs.getDouble("cost")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Could not get all products.");
        }
        return products;
    }
}
