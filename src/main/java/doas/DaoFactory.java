package doas;

import util.Config;

public class DaoFactory {
    private static Config config = new Config();
    private static ProductsDao productsDao;
    private static CartDao cartDao;

    public static ProductsDao getProductsDao() {
        if (productsDao == null) {
            productsDao = new ProductsDao(config);
        }
        return productsDao;
    }

    public static CartDao getCartDao() {
        if (cartDao == null) {
            cartDao = new CartDao(config);
        }
        return cartDao;
    }
}
