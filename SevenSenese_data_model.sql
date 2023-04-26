CREATE TABLE booking_customers (
    booking_id  NUMBER NOT NULL,
    customer_id NUMBER NOT NULL,
    cost        NUMBER
)
LOGGING;

ALTER TABLE booking_customers ADD CONSTRAINT booking_customers_pk PRIMARY KEY ( booking_id,
                                                                                customer_id );

CREATE TABLE bookings (
    booking_id   NUMBER NOT NULL,
    game_id      NUMBER NOT NULL,
    employee_id  NUMBER NOT NULL,
    location_id  NUMBER NOT NULL,
    booking_date DATE,
    num_players  NUMBER,
    total_cost   NUMBER,
    tip_received NUMBER
)
LOGGING;

ALTER TABLE bookings ADD CONSTRAINT bookings_pk PRIMARY KEY ( booking_id );

CREATE TABLE customers (
    customer_id NUMBER NOT NULL,
    name        VARCHAR2(100),
    sum_cost    NUMBER
)
LOGGING;

ALTER TABLE customers ADD CONSTRAINT customer_pk PRIMARY KEY ( customer_id );

CREATE TABLE employees (
    employee_id NUMBER NOT NULL,
    name        VARCHAR2(100),
    role        VARCHAR2(100),
    sum_tip     NUMBER
)
LOGGING;

ALTER TABLE employees ADD CONSTRAINT employee_pk PRIMARY KEY ( employee_id );

CREATE TABLE games (
    game_id         NUMBER NOT NULL,
    name            VARCHAR2(100),
    description     VARCHAR2(100),
    min_players     NUMBER,
    max_players     NUMBER,
    cost_per_player NUMBER,
    genre_id        NUMBER NOT NULL
)
LOGGING;

ALTER TABLE games ADD CONSTRAINT games_pk PRIMARY KEY ( game_id );

CREATE TABLE genre (
    genre_id NUMBER NOT NULL,
    genre    VARCHAR2(100)
)
LOGGING;

ALTER TABLE genre ADD CONSTRAINT genre_pk PRIMARY KEY ( genre_id );

CREATE TABLE locations (
    location_id NUMBER NOT NULL,
    location    VARCHAR2(100)
)
LOGGING;

ALTER TABLE locations ADD CONSTRAINT locations_pk PRIMARY KEY ( location_id );

ALTER TABLE booking_customers
    ADD CONSTRAINT booking_customers_bookings_fk FOREIGN KEY ( booking_id )
        REFERENCES bookings ( booking_id )
    NOT DEFERRABLE;

ALTER TABLE booking_customers
    ADD CONSTRAINT booking_customers_customers_fk FOREIGN KEY ( customer_id )
        REFERENCES customers ( customer_id )
    NOT DEFERRABLE;

ALTER TABLE bookings
    ADD CONSTRAINT bookings_employee_fk FOREIGN KEY ( employee_id )
        REFERENCES employees ( employee_id )
    NOT DEFERRABLE;

ALTER TABLE bookings
    ADD CONSTRAINT bookings_games_fk FOREIGN KEY ( game_id )
        REFERENCES games ( game_id )
    NOT DEFERRABLE;

ALTER TABLE bookings
    ADD CONSTRAINT bookings_locations_fk FOREIGN KEY ( location_id )
        REFERENCES locations ( location_id )
    NOT DEFERRABLE;

ALTER TABLE games
    ADD CONSTRAINT games_genre_fk FOREIGN KEY ( genre_id )
        REFERENCES genre ( genre_id )
    NOT DEFERRABLE;