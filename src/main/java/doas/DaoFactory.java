package doas;

import util.Config;

public class DaoFactory {
    private static Config config = new Config();
    private static ProductsDao productsDao;

    public static ProductsDao getProductsDao() {
        if (productsDao == null) {
            productsDao = new ProductsDao(config);
        }
        return productsDao;
    }

}
