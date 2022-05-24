package doas;

import models.*;
import util.*;
import java.sql.*;
import java.util.*;
import com.mysql.cj.jdbc.Driver;

public class ProductsDao {

    private final Connection connection;

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

    private List<Product> buildProductList (ResultSet rs) throws SQLException{
        List<Product> products = new ArrayList();
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
        return products;
    }

    // select * from products group by item_id limit 3;
    public List<Product> topThreeProducts() {
        try {
            PreparedStatement statement = connection.prepareStatement("select * from products group by item_id limit 3");
            return buildProductList(statement.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    // select * from products group by item_id;
    public List<Product> firstProducts() {
        try {
            PreparedStatement statement = connection.prepareStatement("select * from products group by item_id");
            return buildProductList(statement.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    public List<Product> findByCategoryName(String name) {
        try {
            PreparedStatement statement = connection.prepareStatement("select * from products where item_id in (select item_id from items_categories where category_id in (select categories.id from categories where categories.name = ?)) group by item_id");
            statement.setString(1, name);
            return buildProductList(statement.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    public List<Product> getByItemName(String name){
        try {
            PreparedStatement statement = connection.prepareStatement("select * from products p where p.item_id in (select i.id from items i where name = ?)");
            statement.setString(1, name);
            return buildProductList(statement.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    public List<Product> getShoppingCart() {
        try {
            PreparedStatement statement = connection.prepareStatement("select * from products p where p.id in (select c.product_id from carts c)");
            return buildProductList(statement.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    public List<Long> getCartQuantities() {
        List<Long> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select quantity from carts");
            ResultSet resultSet = statement.executeQuery();

            while(resultSet.next()) {
                list.add(resultSet.getLong("quantity"));
            } return list;
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    public long getCartQuantity(long id) {
        try {
            PreparedStatement statement = connection.prepareStatement("select c.quantity from carts c where product_id = ?");
            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();

            while(resultSet.next()) { return resultSet.getLong("quantity"); }
            return 0L;
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    public boolean setCartQuantity(long productId, long quantity) {
        try {
            PreparedStatement statement = connection.prepareStatement("update carts set quantity = ? where product_id = ?");
            statement.setLong(1, quantity);
            statement.setLong(2, productId);
            return statement.execute();
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    public long addProductCart(long productId, long quantity) {
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO carts(product_id, quantity) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS);
            statement.setLong(1, productId);
            statement.setLong(2, quantity);
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    public boolean deleteProductCart(long productId) {
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM carts WHERE product_id = ?");
            statement.setLong(1, productId);
            return statement.execute();
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

}
