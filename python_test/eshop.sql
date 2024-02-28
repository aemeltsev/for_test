CREATE TABLE orders(
	order_id INT NOT NULL,
	number_id INT NOT NULL,
	product_id INT NOT NULL,
	product_vol INT,
	PRIMARY KEY (order_id)
);

CREATE TABLE product(
	product_id INT NOT NULL,
	product_name VARCHAR(20),
	PRIMARY KEY (product_id)
);

CREATE TABLE rack(
	rack_id INT NOT NULL,
	rack_name VARCHAR(2) NOT NULL,
	PRIMARY KEY (rack_id)
);

CREATE TABLE product_rack(
	product_id INT NOT NULL,
	rack_id INT NOT NULL,
	order_id INT NOT NULL,
	product_add_rack VARCHAR(20),
	PRIMARY KEY (product_id, rack_id, order_id)
);

ALTER TABLE orders ADD CONSTRAINT fk_orders_product_id FOREIGN KEY (product_id) REFERENCES product(product_id);

ALTER TABLE product_rack ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES product(product_id);
ALTER TABLE product_rack ADD CONSTRAINT fk_rack_id FOREIGN KEY (rack_id) REFERENCES rack(rack_id);
ALTER TABLE product_rack ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id);

INSERT INTO product(product_id, product_name) VALUES (1, 'Ноутбук');
INSERT INTO product(product_id, product_name) VALUES (2, 'Телевизор');
INSERT INTO product(product_id, product_name) VALUES (3, 'Телефон');
INSERT INTO product(product_id, product_name) VALUES (4, 'Системный блок');
INSERT INTO product(product_id, product_name) VALUES (5, 'Часы');
INSERT INTO product(product_id, product_name) VALUES (6, 'Микрофон');

INSERT INTO rack(rack_id, rack_name) VALUES (1, 'А');
INSERT INTO rack(rack_id, rack_name) VALUES (2, 'Б');
INSERT INTO rack(rack_id, rack_name) VALUES (3, 'В');
INSERT INTO rack(rack_id, rack_name) VALUES (4, 'Г');
INSERT INTO rack(rack_id, rack_name) VALUES (5, 'Д');
INSERT INTO rack(rack_id, rack_name) VALUES (6, 'Е');
INSERT INTO rack(rack_id, rack_name) VALUES (7, 'Ж');
INSERT INTO rack(rack_id, rack_name) VALUES (8, 'З');

INSERT INTO orders(order_id, number_id, product_id, product_vol) VALUES (1, 10, 1, 2);
INSERT INTO orders(order_id, number_id, product_id, product_vol) VALUES (2, 11, 2, 3);
INSERT INTO orders(order_id, number_id, product_id, product_vol) VALUES (3, 14, 1, 3);
INSERT INTO orders(order_id, number_id, product_id, product_vol) VALUES (4, 10, 3, 1);
INSERT INTO orders(order_id, number_id, product_id, product_vol) VALUES (5, 14, 4, 4);
INSERT INTO orders(order_id, number_id, product_id, product_vol) VALUES (6, 15, 5, 1);
INSERT INTO orders(order_id, number_id, product_id, product_vol) VALUES (7, 10, 6, 1);

INSERT INTO product_rack(product_id, rack_id, order_id, product_add_rack) VALUES (1, 1, 1, '');
INSERT INTO product_rack(product_id, rack_id, order_id, product_add_rack) VALUES (2, 1, 2, '');
INSERT INTO product_rack(product_id, rack_id, order_id, product_add_rack) VALUES (1, 1, 3, '');

INSERT INTO product_rack(product_id, rack_id, order_id, product_add_rack) VALUES (3, 2, 4, 'З, В');

INSERT INTO product_rack(product_id, rack_id, order_id, product_add_rack) VALUES (4, 7, 5, '');
INSERT INTO product_rack(product_id, rack_id, order_id, product_add_rack) VALUES (5, 7, 6, 'А');
INSERT INTO product_rack(product_id, rack_id, order_id, product_add_rack) VALUES (6, 7, 7, '');
