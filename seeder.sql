USE shopping_db;

INSERT INTO items (name) VALUES
('Unbelievable'),
('Clearness'),
('Plainness');

INSERT INTO categories (name) VALUES
('Category 1'),
('Category 2'),
('Category 3'),
('Category 4');

INSERT INTO items_categories (item_id, category_id) VALUES
(1, 1),
(1, 2),
(1, 4);

INSERT INTO colors (name) VALUES
('White'),
('Grey'),
('Black');

INSERT INTO products (item_id, color_id, height, width, length, dimension_unit, weight, weight_unit, description, cost, quantity) VALUES
(1, 1, 14.00, 12.00, 15.00, 'in', 19.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 45.00, 0),
(1, 2, 78.00, 15.00, 19.00, 'in', 56.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 50.00, 0),
(1, 3, 88.00, 23.00, 55.00, 'in', 12.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 55.00, 0);