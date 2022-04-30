package doas;

import models.Products;
import util.Config;

public class DaoFactory {
    private static Products productsDao;
    private static Config config = new Config();

    public static Products getProductsDao() {
        if (productsDao == null) {
            productsDao = new ProductsDao(config);
        }
        return productsDao;
    }
}