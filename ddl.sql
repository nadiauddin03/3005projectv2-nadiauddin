/*CREATING THE DATABASE*/

CREATE DATABASE healthandfitness
    WITH
    OWNER = postgres 
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

/*SECTION 1: MEMBERS TABLE*/

CREATE TABLE MEMBERS (
	member_id SERIAL PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	phone_number VARCHAR(15)
);

CREATE TABLE HEALTHMETRICS (
	healthmetrics_id SERIAL PRIMARY KEY,
	member_id INT,
	weight INT,
	height INT,
	heart_rate INT,
	blood_pressure INT,
	recorded_date DATE DEFAULT CURRENT_DATE,
	FOREIGN KEY(member_id)
		REFERENCES MEMBERS (member_id)
);

CREATE TABLE FITGOALS (
	goals_id SERIAL PRIMARY KEY,
	member_id INT,
	goal_description TEXT NOT NULL,
	start_date DATE,
	expected_enddate DATE,
	FOREIGN KEY(member_id)
		REFERENCES MEMBERS (member_id) 
);

/*this should create different sets of routines for members to choose*/
CREATE TABLE EXERCISEROUTINES (
	routine_id SERIAL PRIMARY KEY,
	routine_name VARCHAR(255),
	description TEXT
);

/*create a database for members to choose a routine for themselves*/
CREATE TABLE MEMBERROUTINE (
	member_routine_id SERIAL PRIMARY KEY,
	member_id INT,
	routine_id INT,
	end_date DATE,
	FOREIGN KEY(member_id)
		REFERENCES MEMBERS (member_id),
	FOREIGN KEY(routine_id)
		REFERENCES EXERCISEROUTINES (routine_id)
);

CREATE TABLE ACHIEVEMENTS (
	achieve_id SERIAL PRIMARY KEY,
	member_id INT,
	goals_id INT, 
	expected_enddate DATE,
	goal_achieved_description TEXT,
	FOREIGN KEY(member_id)
		REFERENCES MEMBERS (member_id),
	FOREIGN KEY(goals_id)
		REFERENCES FITGOALS (goals_id)
);

CREATE TABLE HEALTHSTATS (
	healthstat_id SERIAL PRIMARY KEY,
	member_id INT,
	avg_weight INT,
	avg_height INT,
	min_heart_rate INT,
	max_heart_rate INT,
	min_blood_pressure INT,
	max_blood_pressure INT,
	FOREIGN KEY(member_id)
		REFERENCES MEMBERS (member_id)
);

/*SECTION 2: TRAINER TABLES*/

CREATE TABLE TRAINERS (
	trainer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	phone VARCHAR(255),
	qualifications TEXT,
	availability_date DATE
);

CREATE TABLE GROUPFITCLASS (
	groupfit_class_id SERIAL PRIMARY KEY,
	class_name VARCHAR(255) NOT NULL,
	description TEXT,
	trainer_id INT, 
	date_of_class DATE,
	FOREIGN KEY(trainer_id)
		REFERENCES TRAINERS (trainer_id)
);
CREATE TABLE PERSONALBOOKINGS (
	booking_id SERIAL PRIMARY KEY,
	member_id INT,
	member_firstname VARCHAR(255),
	member_lastname VARCHAR(255),
	trainer_id INT,
	trainer_firstname VARCHAR(255),
	trainer_lastname VARCHAR(255),
	booking_date DATE,
	status VARCHAR(255),
	FOREIGN KEY(member_id)
		REFERENCES MEMBERS (member_id),
	FOREIGN KEY(trainer_id)
		REFERENCES TRAINERS (trainer_id)
);
CREATE TABLE GROUPBOOKINGS (
	groupbooking_id SERIAL PRIMARY KEY,
	member_id INT,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	group_class_choice VARCHAR(255) NOT NULL,
	booking_date DATE,
	status VARCHAR(255),
	FOREIGN KEY(member_id)
		REFERENCES MEMBERS (member_id)
);

/*SECTION 3: ADMIN STAFF TABLES*/
CREATE TABLE ADMINSTAFF (
	admin_id SERIAL PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	position_title VARCHAR(255), 
	email VARCHAR(255) UNIQUE NOT NULL,
	phone_number VARCHAR(15)
);

CREATE TABLE ROOMS (
	room_id SERIAL PRIMARY KEY,
	room_name VARCHAR(255),
	room_location VARCHAR(255),
	availability_date DATE
);

CREATE TABLE ROOMBOOKINGS (
	roombooking_id SERIAL PRIMARY KEY,
	room_id INT,
	room_name VARCHAR(255),
	admin_id INT, 
	date_booked DATE, 
	status VARCHAR(255),
	FOREIGN KEY(room_id)
		REFERENCES ROOMS (room_id),
	FOREIGN KEY(admin_id)
		REFERENCES ADMINSTAFF (admin_id)
);
CREATE TABLE CLASSSCHEDULE (
	schedule_id SERIAL PRIMARY KEY,
	groupfit_class_id INT,
	class_name VARCHAR(255),
	schedule_date DATE,
	FOREIGN KEY(groupfit_class_id)
		REFERENCES GROUPFITCLASS (groupfit_class_id)
);

CREATE TABLE EQUIPMENTLIST (
	equipment_id SERIAL PRIMARY KEY,
	equipment_name VARCHAR(255),
	description TEXT,
	inventory_count INT 
);
CREATE TABLE EQUIPMENTMONITOR (
	monitor_id SERIAL PRIMARY KEY,
	admin_id INT,
	equipment_id INT,
	equipment_name VARCHAR(255),
	member_id INT,
	member_firstname VARCHAR(255),
	borrowed_date DATE,
	returned_date DATE,
	FOREIGN KEY(admin_id)
		REFERENCES ADMINSTAFF (admin_id),
	FOREIGN KEY(equipment_id)
		REFERENCES EQUIPMENTLIST (equipment_id),
	FOREIGN KEY(member_id)
		REFERENCES MEMBERS (member_id)
);

/*this is a payment service that stores all the credit cards information about members*/
CREATE TABLE PAYMENT (
	payment_id SERIAL PRIMARY KEY,
	member_id INT,
	firstname VARCHAR(255), 
	lastname VARCHAR(255), 
	payment_type VARCHAR(255),
	credit_card_number VARCHAR(20) UNIQUE NOT NULL,
	FOREIGN KEY(member_id)
		REFERENCES MEMBERS (member_id)
);

/*this table is for members to pay certain categories*/
CREATE TABLE MEMBERPAYMENT (
	member_payment_id SERIAL PRIMARY KEY,
	admin_id INT,
	member_id INT,
	member_firstname VARCHAR(255), 
	member_lastname VARCHAR(255), 
	payment_id INT,
	payment_category TEXT, 
	payment_cost INT, 
	status VARCHAR(255),
	FOREIGN KEY(admin_id)
		REFERENCES ADMINSTAFF (admin_id),
	FOREIGN KEY(member_id)
		REFERENCES MEMBERS (member_id),
	FOREIGN KEY(payment_id)
		REFERENCES PAYMENT (payment_id)
);
CREATE TABLE MEMBERBILLS (
	bill_id SERIAL PRIMARY KEY,
	member_id INT,
	payment_id INT,
	member_firstname VARCHAR(255),
	member_lastname VARCHAR(255),
	bill_category TEXT,
	bill_cost INT, 
	bill_duedate DATE,
	status VARCHAR(255), 
	FOREIGN KEY(member_id)
		REFERENCES MEMBERS (member_id),
	FOREIGN KEY(payment_id)
		REFERENCES PAYMENT (payment_id)
);
