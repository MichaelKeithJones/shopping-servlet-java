package models;

import java.util.List;
import java.util.Map;

public interface Products {
    List<Product> all();
    List<Product> topThreeProducts();
    List<Product> firstProducts();
    List<Product> findByItemId(long id);
    List<Product> findByCategoryId(long id);
    Map<Product, Long> getCart();
    long addCart(long productId, long quantity);
    boolean removeCart(long productId);
    boolean updateCart(long productId, long quantity);
    long getProductQuantityFromCart(long productId);
}