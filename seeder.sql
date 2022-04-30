USE shopping_db;

INSERT INTO items (name) VALUES
('Unbelievable'),
('Clearness'),
('Plainness'),
('Legacy'),
('Lucidity'),
('Breathtaking'),
('Simplicity'),
('Directness'),
('Awesomeness');

INSERT INTO categories (name) VALUES
('None'),
('Category 1'),
('Category 2'),
('Category 3'),
('Category 4');

INSERT INTO items_categories (item_id, category_id) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 2),
(3, 1),
(3, 3),
(4, 4),
(5, 2),
(6, 1),
(6, 3),
(6, 4);



INSERT INTO colors (name) VALUES
('None'),
('White'),
('Grey'),
('Black');

INSERT INTO products (item_id, color_id, height, width, length, dimension_unit, weight, weight_unit, description, cost) VALUES
(1, 2, 14.00, 12.00, 15.00, 'in', 19.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 45.00),
(1, 3, 78.00, 15.00, 19.00, 'in', 56.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 50.00),
(1, 4, 88.00, 23.00, 55.00, 'in', 12.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 55.00),

(2, 2, 4.50, 15.59, 8.60, 'in', 2.80, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 40.00),
(2, 3, 4.50, 15.59, 8.60, 'in', 2.80, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 40.00),
(2, 4, 4.50, 15.59, 8.60, 'in', 2.80, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 40.00),

(3, 2, 4.50, 15.59, 8.60, 'in', 2.80, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 40.00),
(3, 3, 4.50, 15.59, 8.60, 'in', 2.80, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 40.00),
(3, 4, 4.50, 15.59, 8.60, 'in', 2.80, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 40.00),

(4, 2, 0.50, 2.30, 0.30, 'in', 2.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 60.00),
(4, 3, 0.50, 2.30, 0.30, 'in', 2.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 60.00),
(4, 4, 0.50, 2.30, 0.30, 'in', 2.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 60.00),

(5, 2, 8.00, 22.00, 15.00, 'in', 12.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 50.00),
(5, 3, 8.00, 22.00, 15.00, 'in', 12.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 50.00),
(5, 4, 8.00, 22.00, 15.00, 'in', 12.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 50.00),

(6, 1, 45.00, 23.00, 88.00, 'in', 56.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 60.00),

(7, 1, 4.50, 15.59, 8.60, 'in', 2.80, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 40.00),

(8, 2, 32.00, 36.00, 54.00, 'in', 45.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 60.00),
(8, 3, 32.00, 36.00, 54.00, 'in', 45.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 60.00),
(8, 4, 32.00, 36.00, 54.00, 'in', 45.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 60.00),

(9, 2, 2.20, 12.00, 4.50, 'in', 35.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 50.00),
(9, 3, 2.20, 12.00, 4.50, 'in', 35.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 50.00),
(9, 4, 2.20, 12.00, 4.50, 'in', 35.00, 'oz', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.', 50.00);


INSERT INTO carts (product_id, quantity) VALUES
    (1, 2);