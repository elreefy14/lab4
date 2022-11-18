CREATE DATABASE lab4;
CREATE TABLE customer
(
    customer_id         INT              NOT NULL        AUTO_INCREMENT,
    customer_name       VARCHAR(30)      NOT NULL,
    city                VARCHAR(30)      NOT NULL,
    PRIMARY KEY(customer_id)
);
CREATE TABLE `order`
(
    order_id            INT              NOT NULL       AUTO_INCREMENT,
    order_date          datetime         NOT NULL,
    customer_id         INT              NOT NULL,
    PRIMARY KEY(order_id)
);
CREATE TABLE order_item
(
    order_id            INT              NOT NULL,
    item_id             INT              NOT NULL,
    quantity            INT              NOT NULL,
    PRIMARY KEY(order_id,item_id)
);
CREATE TABLE item
(
    item_id             INT              NOT NULL       AUTO_INCREMENT,
    unit_price          DECIMAL(10,2)     NOT NULL,
    PRIMARY KEY(item_id)
);
CREATE TABLE shipment
(
    order_id            INT              NOT NULL,
    warehouse_id        INT              NOT NULL,
    ship_date           datetime         NOT NULL,
    PRIMARY KEY(order_id, warehouse_id)
);
CREATE TABLE warehouse 
(
    warehouse_id        INT              NOT NULL       AUTO_INCREMENT,
    warehouse_city      VARCHAR(30)      NOT NULL,
    PRIMARY KEY(warehouse_id)
);

ALTER TABLE `order` ADD FOREIGN KEY (customer_id) REFERENCES customer(customer_id);
ALTER TABLE order_item ADD FOREIGN KEY (order_id) REFERENCES `order`(order_id);
ALTER TABLE order_item ADD FOREIGN KEY (item_id) REFERENCES item(item_id);
ALTER TABLE shipment ADD FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id);
ALTER TABLE shipment ADD FOREIGN KEY (order_id) REFERENCES `order`(order_id);

