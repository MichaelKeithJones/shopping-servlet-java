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

    private String getItemName(long id) {
        String name = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT name FROM items WHERE id = ?");
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) name = rs.getString(1);
        } catch (SQLException e) {
            System.out.println("Could not get item name.");
        }
        return name;
    }

    private String getColorName(long id) {
        String name = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT name FROM colors WHERE id = ?");
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) name = rs.getString(1);
        } catch (SQLException e) {
            System.out.println("Could not get color name.");
        }
        return name;
    }

    private 

    @Override
    public List<Product> all() {
        List<Product> products = new ArrayList();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM products");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                products.add(new Product(
                        rs.getLong("id"),
                        getItemName(rs.getLong("item_id")),
                        getColorName(rs.getLong("color_id")),
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

    // Todo: List first of all products list, limit: 3      // select * from products group by item_id limit 3;
    // Todo: List first of all products list                // select * from products group by item_id;
    // Todo: List all product by item                       // select * from products where item_id = 1;
    // Todo: List all products by category                  // select *from products where item_id in (select item_id from items where item_id in (select item_id from items_categories where category_id = 4)) group by item_id;
    // Todo: List all products from shopping cart           // select p.*, c.quantity from products as p join carts as c on c.product_id = p.id where p.id in (select c.id from carts where c.product_id = p.id);
}
