CREATE TABLE users (
    user_id serial,
    user_name varchar(80) NOT NULL,
    pass varchar(80) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE period (
    deadline_id serial,
    user_id int,
    coupon_id int,
    number int DEFAULT 1,
    expire_date date DEFAULT '2030-3-31' NOT NULL,
    used int DEFAULT 0 NOT NULL,
    PRIMARY KEY (deadline_id)
);

CREATE TABLE coupon (
    coupon_id serial,
    coupon_name varchar(80),
    effect varchar(200),
    PRIMARY KEY (coupon_id)   
);

CREATE TABLE available_stores (
    coupon_id int,
    store_id int,
    PRIMARY KEY (coupon_id, store_id)
);

CREATE TABLE store (
    store_id serial,
    store_name varchar(80),
    info varchar(200),
    adress varchar(80),
    location point,
    PRIMARY KEY (store_id)    
);