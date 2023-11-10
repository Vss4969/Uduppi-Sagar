-- create user "restaurant"@"localhost" identified by "udupi";
-- create database RMS;
-- grant all privileges on RMS.* to "restaurant"@"localhost";
-- mysql -u restaurant -p
-- udupi
-- use RMS

create table users (
    user_name   varchar(20),
    password    varchar(20),
    email_id    varchar(50),
    phone_no    numeric(10),
    img         varchar(100),
    address     varchar(100),
    primary key (email_id)
)

create table menu (
    food_id     varchar(4),
    food_name   varchar(50),
    food_type   varchar(9) check (food_type in ("starters", "mains", "drinks", "snacks", "desserts")),
    food_tag    varchar(1) check (food_tag in ("V", "N")),
    price       int,
    primary key (food_id)
)

create table orders (
    order_id    INT NOT NULL AUTO_INCREMENT,
    email_id    varchar(50),
    food_id     varchar(4),
    time        timestamp,
    status      boolean,
    primary key (order_id),
    foreign key (email_id) references users(email_id),
    foreign key (food_id) references menu(food_id)
);
