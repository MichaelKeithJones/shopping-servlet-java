package doas;

import models.*;
import util.*;
import java.sql.*;
import java.util.*;
import com.mysql.cj.jdbc.Driver;

public class CartDao {

    private final Connection connection;

    public CartDao(Config config) {
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

    private List<Cart> buildList (ResultSet rs) throws SQLException{
        List<Cart> cart = new ArrayList();
        while (rs.next()) {
            cart.add(new Cart(
                rs.getString("name"),
                rs.getDouble("cost"),
                rs.getString("color"),
                rs.getLong("quantity")
            ));
        }
        return cart;
    }

    public List<Cart> all() {
        try {
            PreparedStatement statement = connection.prepareStatement("select i.name as name, p.cost as cost, c.name as color, t.quantity as quantity from products p join colors c on p.color_id = c.id join items i on p.item_id = i.id join carts t on p.id = t.product_id");
            return buildList(statement.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all of shopping cart. |-----//", e);
        }
    }

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

    public boolean removeCart(long productId) {
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM carts WHERE product_id = ?");
            statement.setLong(1, productId);
            return statement.execute();
        } catch (SQLException e) {
            throw new RuntimeException("//-----| Error: Could not GET all products |-----//", e);
        }
    }

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
