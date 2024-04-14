/*Insert values in the MEMBERS table*/
INSERT INTO MEMBERS (member_id, first_name, last_name, email, phone_number)
VALUES
    (1, 'Lele', 'Pons', 'lele@email.com', '165785432'),
    (2, 'Lola', 'Samuel', 'lolasam@email.com', '89065890'),
    (3, 'Lucy', 'Sosa', 'lina@email.com', '3454567345'),
    (4, 'Zeenat', 'Zuzu', 'z@email.com', '475609756'),
    (5, 'Abid', 'Abdul', 'abida@email.com', '2315468'),
    (6, 'Nazifa', 'Charlie', 'nazc@email.com', '67485345'),
    (7, 'Lucas', 'Quao', 'lqheadquarters@email.com', '7895463');

/*Insert values in the HEALTHMETRICS table*/
INSERT INTO HEALTHMETRICS (healthmetrics_id, member_id, weight, height, heart_rate, blood_pressure, recorded_date)
VALUES
    (1, 3, 120, 87, 90, 90, CURRENT_DATE),
    (2, 3, 130, 56, 91, 110, CURRENT_DATE),
    (3, 1, 120, 78, 92, 115, CURRENT_DATE),
    (4, 4, 140, 76, 94, 112, CURRENT_DATE),
    (5, 5, 120, 70, 98, 94, CURRENT_DATE),
    (6, 5, 160, 65, 90, 120, CURRENT_DATE),
    (7, 6, 120, 72, 93, 125, CURRENT_DATE);


/*Insert values in the FITGOALS table*/
INSERT INTO FITGOALS (goals_id, member_id, goal_description, start_date, expected_enddate)
VALUES
    (1, 1, 'Lose 5 pounds by the end of April', '2024-04-01', '2024-04-30'),
    (2, 2, 'Run 3 miles without stopping', '2024-04-05', '2024-05-05'),
    (3, 3, 'Increase strength by following a weightlifting program', '2024-04-10', '2024-06-10'),
    (4, 4, 'Complete a 30-day cardio challenge', '2024-04-15', '2024-05-15'),
    (5, 5, 'Improve endurance by cycling 50 miles per week', '2024-04-02', '2024-05-02'),
    (6, 6, 'Eat a balanced diet and lose 3% body fat', '2024-04-08', '2024-07-08'),
    (7, 7, 'Gain 10 pounds of muscle mass', '2024-04-20', '2024-08-01');


/*Insert values in the EXERCISEROUTINES table*/
INSERT INTO EXERCISEROUTINES (routine_id, routine_name, description)
VALUES
    (1, 'Full Body Strength Training', 'A comprehensive routine targeting all major muscle groups with compound exercises.'),
    (2, 'Cardio Blast', 'High-intensity cardio routine including running, cycling, and jumping jacks.'),
    (3, 'Yoga Flow for Flexibility', 'A series of yoga poses aimed at improving flexibility and reducing stress.'),
    (4, 'Upper Body Toning', 'Focuses on sculpting arms, shoulders, and chest using dumbbells and bodyweight exercises.'),
    (5, 'Core Strengthening', 'Exercises to target and strengthen the abdominal muscles and improve core stability.'),
    (6, 'Leg Day Workout', 'Intense leg workout involving squats, lunges, and leg presses for muscle growth.'),
    (7, 'Pilates for Posture', 'Pilates routine emphasizing core strength and posture alignment.'),
    (8, 'Interval Training', 'Combines bursts of high-intensity exercise with periods of rest or lower-intensity activity.'),
    (9, 'Circuit Training', 'A series of exercises performed back-to-back with minimal rest for cardiovascular and strength benefits.'),
    (10, 'Stretching and Mobility', 'Gentle stretches and mobility exercises to improve flexibility and prevent injury.');


/*Insert values in the MEMBERROUTINE table*/
INSERT INTO MEMBERROUTINE (member_routine_id, member_id, routine_id, end_date)
VALUES
    (1, 3, 2, '2024-05-15'),
    (2, 1, 8, '2024-05-10'),
    (3, 7, 3, '2024-05-20'),
    (4, 5, 4, '2024-05-25'),
    (5, 2, 5, '2024-05-05'),
    (6, 4, 7, '2024-06-01'),
    (7, 6, 9, '2024-06-05');


/*Insert values in the ACHIEVEMENTS table*/
INSERT INTO ACHIEVEMENTS (achieve_id, member_id, goals_id, expected_enddate, goal_achieved_description)
VALUES
    (1, 1, 1, '2024-04-30', 'Successfully completed 30 days of Full Body Strength Training.'),
    (2, 2, 2, '2024-05-10', 'Consistently completed Cardio Blast routines for improved cardiovascular health.'),
    (3, 3, 3, '2024-05-20', 'Mastered advanced yoga poses and significantly improved flexibility.'),
    (4, 4, 4, '2024-05-25', 'Achieved upper body toning goals with increased muscle definition.'),
    (5, 5, 5, '2024-05-05', 'Developed strong core muscles through dedicated core strengthening exercises.'),
    (6, 6, 6, '2024-06-01', 'Successfully completed intense leg workouts and increased leg muscle mass.'),
    (7, 7, 7, '2024-06-05', 'Improved posture and core strength through regular Pilates sessions.');


/*Insert values in the HEALTHSTATS table*/
INSERT INTO HEALTHSTATS (healthstat_id, member_id, avg_weight, avg_height, min_heart_rate, max_heart_rate, min_blood_pressure, max_blood_pressure)
VALUES
    (1, 1, 150, 68, 60, 80, 110, 130),
    (2, 2, 148, 67, 62, 82, 112, 132),
    (3, 1, 152, 69, 58, 78, 108, 128),
    (4, 6, 149, 68, 59, 79, 109, 129),
    (5, 5, 151, 70, 61, 81, 111, 131),
    (6, 4, 147, 66, 63, 83, 113, 133),
    (7, 5, 153, 71, 57, 77, 107, 127);

/*Insert values in the TRAINERS table*/
INSERT INTO TRAINERS (trainer_id, first_name, last_name, email, phone, qualifications, availability_date)
VALUES
    (1, 'John', 'Doe', 'johndoe@example.com', '123-456-7890', 'Certified Personal Trainer', '2024-05-01'), 
    (2, 'Jane', 'Smith', 'janesmith@example.com', '987-654-3210', 'Fitness Nutrition Specialist', '2024-05-05'),  
    (3, 'David', 'Johnson', 'davidjohnson@example.com', '555-123-4567', 'Strength and Conditioning Coach', '2024-05-10'), 
    (4, 'Emily', 'Williams', 'emilywilliams@example.com', '444-789-1234', 'Yoga Instructor', '2024-05-15'),  
    (5, 'Michael', 'Brown', 'michaelbrown@example.com', '777-888-9999', 'Group Fitness Instructor', '2024-05-20'),  
    (6, 'Samantha', 'Jones', 'samanthajones@example.com', '222-333-4444', 'Athletic Performance Specialist', '2024-05-25'),  
    (7, 'Chris', 'Taylor', 'christaylor@example.com', '111-222-3333', 'Pilates Instructor', '2024-06-01');  

/*Insert values in the GROUPFITCLASS table*/
INSERT INTO GROUPFITCLASS (groupfit_class_id, class_name, description, trainer_id, date_of_class)
VALUES
    (1, 'Cardio Blast', 'High-intensity cardio workout', 1, '2024-05-01'),  
    (2, 'Yoga Flow', 'Gentle yoga practice for flexibility', 2, '2024-05-05'),  
    (3, 'Strength Training', 'Full-body strength workout', 3, '2024-05-10'),  
    (4, 'Pilates Core', 'Core-strengthening pilates exercises', 4, '2024-05-15'),  
    (5, 'Zumba Dance', 'Latin-inspired dance fitness', 5, '2024-05-20'), 
    (6, 'Bootcamp', 'Outdoor bootcamp fitness session', 6, '2024-05-25'),  
    (7, 'Spin Cycle', 'Indoor cycling spin class', 7, '2024-06-01');  

/*Insert values in PERSONALBOOKINGS table*/
INSERT INTO PERSONALBOOKINGS (booking_id, member_id, member_firstname, member_lastname, trainer_id, trainer_firstname, trainer_lastname, booking_date, status)
VALUES
    (1, 1, (SELECT first_name FROM MEMBERS WHERE member_id = 1), (SELECT last_name FROM MEMBERS WHERE member_id = 1), 1, 'Trainer John', 'Doe', '2024-05-01', 'Confirmed'),  
    (2, 2, (SELECT first_name FROM MEMBERS WHERE member_id = 2), (SELECT last_name FROM MEMBERS WHERE member_id = 2), 2, 'Trainer Jane', 'Smith', '2024-05-05', 'Pending'),  
    (3, 3, (SELECT first_name FROM MEMBERS WHERE member_id = 3), (SELECT last_name FROM MEMBERS WHERE member_id = 3), 3, 'Trainer David', 'Johnson', '2024-05-10', 'Confirmed'),  
    (4, 4, (SELECT first_name FROM MEMBERS WHERE member_id = 4), (SELECT last_name FROM MEMBERS WHERE member_id = 4), 4, 'Trainer Emily', 'Williams', '2024-05-15', 'Cancelled'),  
    (5, 5, (SELECT first_name FROM MEMBERS WHERE member_id = 5), (SELECT last_name FROM MEMBERS WHERE member_id = 5), 5, 'Trainer Michael', 'Brown', '2024-05-20', 'Confirmed'),  
    (6, 6, (SELECT first_name FROM MEMBERS WHERE member_id = 6), (SELECT last_name FROM MEMBERS WHERE member_id = 6), 6, 'Trainer Samantha', 'Jones', '2024-05-25', 'Pending'),  
    (7, 7, (SELECT first_name FROM MEMBERS WHERE member_id = 7), (SELECT last_name FROM MEMBERS WHERE member_id = 7), 7, 'Trainer Chris', 'Taylor', '2024-06-01', 'Confirmed');  

/*Insert values in GROUPBOOKINGS table*/
INSERT INTO GROUPBOOKINGS (groupbooking_id, member_id, first_name, last_name, group_class_choice, booking_date, status)
VALUES
    (1, 1, (SELECT first_name FROM MEMBERS WHERE member_id = 1), (SELECT last_name FROM MEMBERS WHERE member_id = 1), 'Cardio Blast', '2024-05-01', 'Confirmed'), 
    (2, 2, (SELECT first_name FROM MEMBERS WHERE member_id = 2), (SELECT last_name FROM MEMBERS WHERE member_id = 2), 'Yoga Flow', '2024-05-05', 'Pending'),  
    (3, 3, (SELECT first_name FROM MEMBERS WHERE member_id = 3), (SELECT last_name FROM MEMBERS WHERE member_id = 3), 'Strength Training', '2024-05-10', 'Confirmed'),  
    (4, 4, (SELECT first_name FROM MEMBERS WHERE member_id = 4), (SELECT last_name FROM MEMBERS WHERE member_id = 4), 'Emily', 'Williams', 'Pilates Core', '2024-05-15', 'Cancelled'),  
    (5, 5, (SELECT first_name FROM MEMBERS WHERE member_id = 5), (SELECT last_name FROM MEMBERS WHERE member_id = 5), 'Michael', 'Brown', 'Zumba Dance', '2024-05-20', 'Confirmed'),  
    (6, 6, (SELECT first_name FROM MEMBERS WHERE member_id = 6), (SELECT last_name FROM MEMBERS WHERE member_id = 6), 'Bootcamp', '2024-05-25', 'Pending'),  
    (7, 7, (SELECT first_name FROM MEMBERS WHERE member_id = 7), (SELECT last_name FROM MEMBERS WHERE member_id = 7), 'Spin Cycle', '2024-06-01', 'Confirmed');  
	
/*Insert values in ADMINSTAFF table*/
INSERT INTO ADMINSTAFF (admin_id, first_name, last_name, position_title, email, phone_number)
VALUES
    (1, 'Alice', 'Smith', 'Office Manager', 'alice.smith@example.com', '1234567890'),
    (2, 'Bob', 'Johnson', 'HR Coordinator', 'bob.johnson@example.com', '98765-3210'),
    (3, 'Carol', 'Williams', 'Accounts Payable Specialist', 'carol.williams@example.com', '5551234567'),
    (4, 'David', 'Brown', 'IT Administrator', 'david.brown@example.com', '4447891234'),
    (5, 'Eve', 'Davis', 'Marketing Coordinator', 'eve.davis@example.com', '7778889999'),
    (6, 'Frank', 'Wilson', 'Operations Manager', 'frank.wilson@example.com', '2223334444'),
    (7, 'Grace', 'Taylor', 'Executive Assistant', 'grace.taylor@example.com', '1112223333');

/*Insert values in ROOMS table*/
INSERT INTO ROOMS (room_id, room_name, room_location, availability_date)
VALUES
    (1, 'Meeting Room A', 'Main Building, 1st Floor', '2024-05-01'),
    (2, 'Conference Room B', 'East Wing, 2nd Floor', '2024-05-05'),
    (3, 'Training Room C', 'West Wing, 3rd Floor', '2024-05-10'),
    (4, 'Seminar Room D', 'Annex Building, Ground Floor', '2024-05-15'),
    (5, 'Boardroom E', 'Main Building, 2nd Floor', '2024-05-20'),
    (6, 'Alumni Hall F', 'East Wing, 1st Floor', '2024-05-25'),
    (7, 'Studio G', 'West Wing, 4th Floor', '2024-06-01');

/*Insert values in ROOMBOOKINGS table*/
INSERT INTO ROOMBOOKINGS (roombooking_id, room_id, room_name, admin_id, date_booked, status)
VALUES
    (1, 1, 'Meeting Room A', 1, '2024-05-01', 'Confirmed'),  
    (2, 2, 'Conference Room B', 2, '2024-05-05', 'Pending'), 
    (3, 3, 'Training Room C', 3, '2024-05-10', 'Confirmed'),  
    (4, 4, 'Seminar Room D', 4, '2024-05-15', 'Cancelled'),  
    (5, 5, 'Boardroom E', 5, '2024-05-20', 'Confirmed'), 
    (6, 6, 'Alumni Hall F', 6, '2024-05-25', 'Pending'),
    (7, 7, 'Studio G', 7, '2024-06-01', 'Confirmed');  

/*Insert values in CLASSSCHEDULE table*/
INSERT INTO CLASSSCHEDULE (schedule_id, groupfit_class_id, class_name, schedule_date)
VALUES
    (1, 1, 'Cardio Blast', '2024-05-01'),
    (2, 2, 'Yoga Flow', '2024-05-05'),
    (3, 3, 'Strength Training', '2024-05-10'),
    (4, 4, 'Pilates Core', '2024-05-15'),
    (5, 5, 'Zumba Dance', '2024-05-20'),
    (6, 6, 'Bootcamp', '2024-05-25'),
    (7, 7, 'Spin Cycle', '2024-06-01');

/*Insert values in EQUIPMENTLIST table*/
INSERT INTO EQUIPMENTLIST (equipment_id, equipment_name, description, inventory_count)
VALUES
    (1, 'Treadmill', 'Electronic running machine', 5),
    (2, 'Dumbbells', 'Weightlifting equipment for strength training', 10),
    (3, 'Yoga Mats', 'Mats used for yoga exercises', 20),
    (4, 'Resistance Bands', 'Flexible bands used for resistance training', 15),
    (5, 'Stationary Bike', 'Exercise bike for cardiovascular workout', 3),
    (6, 'Kettlebells', 'Weighted balls with handles for various exercises', 8),
    (7, 'Jump Ropes', 'Skipping ropes for cardio and agility training', 12);

/*Insert values in EQUIPMENTMONITOR table*/
INSERT INTO EQUIPMENTMONITOR (monitor_id, admin_id, equipment_id, equipment_name, member_id, member_firstname, borrowed_date, returned_date)
VALUES
    (1, 1, 1, 'Treadmill', 1, (SELECT first_name FROM MEMBERS WHERE member_id = 1), '2024-05-01', '2024-05-10'),  
    (2, 2, 2, 'Dumbbells', 2, (SELECT first_name FROM MEMBERS WHERE member_id = 2), '2024-05-05', '2024-05-15'),    
    (3, 3, 3, 'Yoga Mats', 3, (SELECT first_name FROM MEMBERS WHERE member_id = 3), '2024-05-10', '2024-05-20'),   
    (4, 4, 4, 'Resistance Bands', 4, (SELECT first_name FROM MEMBERS WHERE member_id = 4), '2024-05-15', '2024-05-25'),  
    (5, 5, 5, 'Stationary Bike', 5, (SELECT first_name FROM MEMBERS WHERE member_id = 5), '2024-05-20', '2024-05-30'),  
    (6, 6, 6, 'Kettlebells', 6, (SELECT first_name FROM MEMBERS WHERE member_id = 6), '2024-05-25', '2024-06-05'), 
    (7, 7, 7, 'Jump Ropes', 7, (SELECT first_name FROM MEMBERS WHERE member_id = 7), '2024-06-01', '2024-06-10'); 

/*Insert values in PAYMENT table*/
INSERT INTO PAYMENT (payment_id, member_id, firstname, lastname, payment_type, credit_card_number)
VALUES
    (1, 1, (SELECT first_name FROM MEMBERS WHERE member_id = 1), (SELECT last_name FROM MEMBERS WHERE member_id = 1), 'Credit Card', '1234567890123456'),
    (2, 2, (SELECT first_name FROM MEMBERS WHERE member_id = 2), (SELECT last_name FROM MEMBERS WHERE member_id = 2), '9876543210987654'),
    (3, 3, (SELECT first_name FROM MEMBERS WHERE member_id = 3), (SELECT last_name FROM MEMBERS WHERE member_id = 3), '5555666677778888'),
    (4, 4, (SELECT first_name FROM MEMBERS WHERE member_id = 4), (SELECT last_name FROM MEMBERS WHERE member_id = 4),'4444333322221111'),
    (5, 5, (SELECT first_name FROM MEMBERS WHERE member_id = 5), (SELECT last_name FROM MEMBERS WHERE member_id = 5), '3333333333333'),
    (6, 6, (SELECT first_name FROM MEMBERS WHERE member_id = 6), (SELECT last_name FROM MEMBERS WHERE member_id = 6), '8765432187654321'),
    (7, 7, (SELECT first_name FROM MEMBERS WHERE member_id = 7), (SELECT last_name FROM MEMBERS WHERE member_id = 7), '3333222244445555');

/*Insert values in MEMBERPAYMENT table*/
INSERT INTO MEMBERPAYMENT (member_payment_id, admin_id, member_id, member_firstname, member_lastname, payment_id, payment_category, payment_cost, status)
VALUES
    (1, 1, 1, (SELECT first_name FROM MEMBERS WHERE member_id = 1), (SELECT last_name FROM MEMBERS WHERE member_id = 1), 1, 'Membership Fee', 100, 'Paid'),
    (2, 2, 2, (SELECT first_name FROM MEMBERS WHERE member_id = 2), (SELECT last_name FROM MEMBERS WHERE member_id = 2), 2, 'Class Registration', 50, 'Pending'),
    (3, 3, 3, (SELECT first_name FROM MEMBERS WHERE member_id = 3), (SELECT last_name FROM MEMBERS WHERE member_id = 3), 3, 'Personal Training', 200, 'Paid'),
    (4, 4, 4, (SELECT first_name FROM MEMBERS WHERE member_id = 4), (SELECT last_name FROM MEMBERS WHERE member_id = 4), 4, 'Equipment Rental', 30, 'Paid'),
    (5, 5, 5, (SELECT first_name FROM MEMBERS WHERE member_id = 5), (SELECT last_name FROM MEMBERS WHERE member_id = 5), 5, 'Group Fitness', 80, 'Paid'),
    (6, 6, 6, (SELECT first_name FROM MEMBERS WHERE member_id = 6), (SELECT last_name FROM MEMBERS WHERE member_id = 6), 6, 'Nutritional Counseling', 150, 'Pending'),
    (7, 7, 7, (SELECT first_name FROM MEMBERS WHERE member_id = 7), (SELECT last_name FROM MEMBERS WHERE member_id = 7), 7, 'Membership Renewal', 120, 'Paid');

/*Insert values in MEMBERBILLS table*/
INSERT INTO MEMBERBILLS (bill_id, member_id, payment_id, member_firstname, member_lastname, bill_category, bill_cost, bill_duedate, status)
VALUES
    (1, 1, 1, (SELECT first_name FROM MEMBERS WHERE member_id = 1), (SELECT last_name FROM MEMBERS WHERE member_id = 1), 'Membership Fee', 100, '2024-05-15', 'Unpaid'),
    (2, 2, 2, (SELECT first_name FROM MEMBERS WHERE member_id = 2), (SELECT last_name FROM MEMBERS WHERE member_id = 2), 'Class Registration', 50, '2024-05-20', 'Paid'),
    (3, 3, 3, (SELECT first_name FROM MEMBERS WHERE member_id = 3), (SELECT last_name FROM MEMBERS WHERE member_id = 3), 'Personal Training', 200, '2024-06-01', 'Pending'),
    (4, 4, 4, (SELECT first_name FROM MEMBERS WHERE member_id = 4), (SELECT last_name FROM MEMBERS WHERE member_id = 4), 'Equipment Rental', 30, '2024-06-05', 'Paid'),
    (5, 5, 5, (SELECT first_name FROM MEMBERS WHERE member_id = 5), (SELECT last_name FROM MEMBERS WHERE member_id = 5), 'Group Fitness', 80, '2024-06-10', 'Unpaid'),
    (6, 6, 6, (SELECT first_name FROM MEMBERS WHERE member_id = 6), (SELECT last_name FROM MEMBERS WHERE member_id = 6), 'Nutritional Counseling', 150, '2024-06-15', 'Pending'),
    (7, 7, 7, (SELECT first_name FROM MEMBERS WHERE member_id = 7), (SELECT last_name FROM MEMBERS WHERE member_id = 7), 'Membership Renewal', 120, '2024-06-20', 'Unpaid');
