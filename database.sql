USE shopping_db;

DROP TABLE IF EXISTS carts;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS colors;
DROP TABLE IF EXISTS items_categories;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS items;

CREATE TABLE items (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(255) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE categories (
                            id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                            name VARCHAR(255) NOT NULL,
                            PRIMARY KEY (id)
);

CREATE TABLE items_categories (
                                  item_id INT UNSIGNED NOT NULL,
                                  category_id INT UNSIGNED NOT NULL,
                                  UNIQUE (item_id, category_id),
                                  FOREIGN KEY (item_id) REFERENCES items(id),
                                  FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE colors (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        name VARCHAR(255) NOT NULL,
                        PRIMARY KEY (id)
);

CREATE TABLE products (
                          id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                          item_id INT UNSIGNED NOT NULL,
                          color_id INT UNSIGNED NOT NULL,
                          height DECIMAL(4, 2) NOT NULL,
                          width DECIMAL(4, 2) NOT NULL,
                          length DECIMAL(4, 2) NOT NULL,
                          dimension_unit VARCHAR(8) NOT NULL,
                          weight DECIMAL(4, 2) NOT NULL,
                          weight_unit VARCHAR(8) NOT NULL,
                          description TEXT NOT NULL,
                          cost DECIMAL(4, 2) NOT NULL,
                          PRIMARY KEY (id),
                          UNIQUE (item_id, color_id),
                          FOREIGN KEY (item_id) REFERENCES items(id),
                          FOREIGN KEY (color_id) REFERENCES colors(id)
                              ON DELETE CASCADE
);

CREATE TABLE carts (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       product_id INT UNSIGNED NOT NULL,
                       quantity INT UNSIGNED NOT NULL,
                       PRIMARY KEY (id),
                       UNIQUE (product_id),
                       FOREIGN KEY (product_id) REFERENCES products(id)
);