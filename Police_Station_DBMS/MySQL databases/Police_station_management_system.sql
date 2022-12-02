create database police;
USE  police;
CREATE TABLE citizen(
	user_id INT NOT NULL AUTO_INCREMENT,
    password varchar(250),
    aadhar_no varchar(12),
    first_name varchar(50),
    last_name varchar(25),
    contact_no varchar(20),
    email varchar(60),
    house_no varchar(10),
    locality varchar(20),
    city varchar(20),
    district varchar(20),
    state varchar(20),
    postal_code varchar(10),
    
    PRIMARY KEY (user_id),
    UNIQUE(email)
);
CREATE TABLE fir(
	fir_id INT NOT NULL AUTO_INCREMENT,
    suspect_name varchar(70),
    contact_no varchar(15),
    gender varchar(5),
    address varchar(250),
   place_of_incident varchar(250),
   date_and_time datetime,
   brief varchar(250),
   user_id INT,
  
    
    PRIMARY KEY (fir_id),
    FOREIGN KEY (user_id) references citizen(user_id)
    
);
CREATE TABLE official(
	official_id INT not null AUTO_INCREMENT,
    password varchar(250),
	official_name varchar(70),
    contact_no varchar(15),
    email varchar(60),
    post varchar(30),
    
    PRIMARY KEY (official_id),
    UNIQUE(email)
);
CREATE TABLE permission(
	permission_id INT not null AUTO_INCREMENT,
    subject varchar(50),
	no_of_person varchar(10),
    date_and_time datetime,
    brief varchar(250),
    location varchar(250),
    status varchar(250),
    official_id INT ,
    user_id INT ,
    
    PRIMARY KEY (permission_id),
    FOREIGN KEY (user_id) REFERENCES citizen(user_id),
    FOREIGN KEY (official_id) REFERENCES official(official_id)
    
);
CREATE TABLE challan(
	challan_no INT not null AUTO_INCREMENT,
    dl_number varchar(30),
	vehicle_type varchar(30),
    vehicle_no varchar(30),
    date_and_time datetime,
    voilation varchar(250),
    payment_status varchar(50),
    fine_amount varchar(10) ,
    aadhar_no varchar(12),
	official_id INT ,
    
    PRIMARY KEY (challan_no),
    FOREIGN KEY (official_id) REFERENCES official(official_id)
    
);

CREATE TABLE weapon(
	weapon_id INT not null AUTO_INCREMENT,
    no_of_bullets varchar(20),
    weapon_type varchar(70),
	quantity varchar(10),
    description varchar(250),
   official_id INT ,
    
    PRIMARY KEY (weapon_id),
    FOREIGN KEY (official_id) REFERENCES official(official_id)
    
);
CREATE TABLE vehicle(
	vehicle_id INT not null AUTO_INCREMENT,
    vehicle_no varchar(30),
	vehicle_type varchar(30),
    description varchar(250),
   official_id INT ,
    
    PRIMARY KEY (vehicle_id),
    FOREIGN KEY (official_id) REFERENCES official(official_id)
    
);

create table criminal_record(
	criminal_id int auto_increment not null,
	first_name varchar(100),
	middle_name varchar(100),
	last_name varchar(100),
	criminal_contact_no varchar(15),
	aadhar_no varchar(100),
	description varchar(500),
    fir_no int,
    
	primary key(criminal_id),
	foreign key(fir_no) REFERENCES fir(fir_id)

);
alter table criminal_record auto_increment = 1;



