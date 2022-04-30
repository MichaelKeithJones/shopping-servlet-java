package doas;

import models.*;
import util.*;
import java.sql.*;
import java.util.*;
import com.mysql.cj.jdbc.Driver;

public class ProductsDao implements Products {

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

    private Map<Product, Long> buildCartList (ResultSet rs) throws SQLException{
        Map<Product, Long> cart = new HashMap<>();
        while (rs.next()) {
            cart.put(new Product(
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
            ), rs.getLong("quantity") );
        }
        return cart;
    }

    @Override
    public List<Product> all() {
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM products");
            return buildProductList(statement.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    // Todo: List first of all products list, limit: 3      // select * from products group by item_id limit 3;
    @Override
    public List<Product> topThreeProducts() {
        try {
            PreparedStatement statement = connection.prepareStatement("select * from products group by item_id limit 3");
            return buildProductList(statement.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    // Todo: List first of all products list                // select * from products group by item_id;
    @Override
    public List<Product> firstProducts() {
        try {
            PreparedStatement statement = connection.prepareStatement("select * from products group by item_id");
            return buildProductList(statement.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    // Todo: List all product by item                       // select * from products where item_id = 1;
    @Override
    public List<Product> findByItemId(long id) {
        try {
            PreparedStatement statement = connection.prepareStatement("select * from products where item_id = ?");
            statement.setLong(1, id);
            return buildProductList(statement.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    // Todo: List all products by category                  // select * from products where item_id in (select item_id from items where item_id in (select item_id from items_categories where category_id = 4)) group by item_id;
    @Override
    public List<Product> findByCategoryId(long id) {
        try {
            PreparedStatement statement = connection.prepareStatement("select * from products where item_id in (select item_id from items where item_id in (select item_id from items_categories where category_id = ?)) group by item_id;");
            statement.setLong(1, id);
            return buildProductList(statement.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    // Todo: List all products from shopping cart           // select p.*, c.quantity from products as p join carts as c on c.product_id = p.id where p.id in (select c.id from carts where c.product_id = p.id);
    @Override
    public Map<Product, Long> getCart() {
        try {
            PreparedStatement statement = connection.prepareStatement("select p.*, c.quantity from products as p join carts as c on c.product_id = p.id where p.id in (select c.id from carts where c.product_id = p.id)");
            return buildCartList(statement.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    @Override
    public long addCart(long productId, long quantity) {
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO carts (product_id, quantity) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS);
            statement.setLong(1, productId);
            statement.setLong(2, quantity);
            statement.executeUpdate();
            ResultSet resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) return resultSet.getLong(1);
            return 0L;
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    @Override
    public boolean removeCart(long productId) {
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM carts WHERE product_id = ?");
            statement.setLong(1, productId);
            return statement.execute();
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    @Override
    public boolean updateCart(long productId, long quantity) {
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE carts SET quantity = ? WHERE product_id = ?");
            statement.setLong(1, quantity);
            statement.setLong(2, productId);
            return statement.execute();
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

    @Override
    public long checkCart(long productId) {
        try {
            PreparedStatement statement = connection.prepareStatement("select quantity from carts where product_id = ?");
            statement.setLong(1, productId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) return rs.getLong("quantity");
            return 0L;
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }
}
