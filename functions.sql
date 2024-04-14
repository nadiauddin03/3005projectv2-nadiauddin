/*1: MEMBER FUNCTIONS*/

/*user registration function*/
CREATE FUNCTION user_registration (id int, fname varchar, lname varchar, email_input varchar, phone_input varchar)
returns table(
member_id int, 
first_name varchar, 
last_name varchar, 
email varchar,
phone_number varchar)
language plpgsql
AS
$$
begin
   insert into members 
   values (id, fname, lname, email_input, phone_input);

   return query
   select * 
   from members
   where members.member_id = id;
end;
$$;

/*profile management*/
/*update personal information*/
CREATE FUNCTION update_personal_info(id int, choice varchar, value varchar)
returns table(
member_id varchar, 
first_name varchar, 
last_name varchar, 
email varchar,
phone_number varchar)
language plpgsql
AS
$$
begin
   if choice = 'first_name' then
    update members
    set first_name = value
    where members.member_id = id;
   
   elsif choice = 'last_name' then
    update members
    set last_name = value
    where members.member_id = id;
   
   elsif choice = 'email' then
    update members
    set email = value
    where members.member_id = id;
   
   elsif choice = 'phone_number' then
    update members
    set phone_number = value
    where members.member_id = id;
   end if;

    return query
    select member_id, first_name, last_name, email, phone_number
    from members
    where member.member_id = id;
end;
$$;

/*update fitness goals*/
CREATE FUNCTION update_fitnessgoals(id int, goal text)
returns table(
goal_id int, 
member_id int, 
goal_description text,
start_date date,
expected_enddate date)
language plpgsql
AS
$$
begin
   update fitgoals
   set goal_description = goal
   where fitgoals.member_id=id;

   return query 
   select fitgoals.goal_id, fitgoals.member_id, fitgoals.goal_description, fitgoals.start_date, fitgoals.expected_enddate
   from fitgoals
   join members on fitgoals.member_id = members.member_id
   where fitgoals.member_id=id;
end;
$$;

/*update health metrics*/
CREATE FUNCTION update_healthmetrics(id int, choice varchar, value int)
returns table(
healthmetrics_id int,
member_id int, 
weight int,
height int,
heart_rate int, 
blood_pressure int,
recorded_date date)
language plpgsql
AS
$$
begin
   if choice='weight' then
      update healthmetrics
      set weight = value
      where healthmetrics.member_id=id;
   elsif choice='height' then
      update healthmetrics
      set height = value
      where healthmetrics.member_id=id;
   elsif choice='heart_rate' then
      update healthmetrics
      set heart_rate = value
      where healthmetrics.member_id=id;
   elsif choice='blood_pressure' then
      update healthmetrics
      set blood_pressure = value
      where healthmetrics.member_id=id;
   end if;
   return query 
   select healthmetrics.healthmetrics_id, healthmetrics.member_id, healthmetrics.weight, healthmetrics.height, healthmetrics.heart_rate, healthmetrics.blood_pressure, healthmetrics.recorded_date
   from healthmetrics
   join members on healthmetrics.member_id = members.member_id
   where healthmetrics.member_id=id;
end;
$$;

/*dashboard display*/
/*exercise table*/
CREATE FUNCTION display_exercise(id int)
returns table(
member_routine_id int,
member_id int,
routine_id int,
routine_name varchar,
description text,
end_date date)
language plpgsql
AS
$$
begin
   return query 
   select memberroutine.member_routine_id, members.member_id, exerciseroutine.routine_id, exerciseroutine.routine_name, exerciseroutine.description, exerciseroutine.end_date
   from memberroutine
   join members on members.member_id=memberroutine.member_id
   join exerciseroutines on memberroutine.routine_id=exerciseroutine.routine_id
   where memberroutine.member_id=id;
end;
$$;

/*achievements table*/
CREATE FUNCTION display_achievements(id int)
returns table(
achieve_id int,
member_id int,
goals_id int, 
goals_description text,
start_date date,
expected_enddate date,
goal_achieved_description text)
language plpgsql
AS
$$
begin
   return query 
   select achievements.achieve_id, members.member_id, fitgoals.goals_id, fitgoals.goals_description, fitgoals.start_date, fitgoals.expected_enddate, achievements.goal_achieved_description
   from achievements
   join fitgoals on achievements.goals_id=fitgoals.goals_id
   join members on fitgoals.member_id=members.member_id
   where achievements.member_id=id;
end;
$$;

/*healthstats table*/
CREATE FUNCTION display_healthstats(id int)
returns table(
healthstat_id int,
member_id int,
avg_weight int,
avg_height int,
min_heart_rate int,
max_heart_rate int,
min_blood_pressure int,
max_blood_pressure int)
language plpgsql
AS
$$
begin
   return query 
   select AVG(weight), AVG(height), MIN(heart_rate), MAX(heart_rate), MIN(blood_pressure), MAX(blood_pressure)
   from healthstats
   join members on members.member_id=healthstats.member_id
   where healthstats.member_id=id;
end;
$$;

/*schedule management*/
CREATE FUNCTION scheduling_personaltraining(id int, option varchar)
returns table(
booking_id int,
member_id int,
member_firstname varchar,
member_lastname varchar,
trainer_id int,
trainer_firstname varchar,
trainer_lastname varchar,
booking_date date,
status varchar)
language plpgsql
AS
$$
begin
   if option='SCHEDULE' then
      update personalbookings
      set status=option
      where booking_id=id;
   elsif option='CANCEL' then
      update personalbookings
      set status=option
      where booking_id=id;
   return query 
   select booking_id, member_id, member_firstname, member_lastname, trainer_id, trainer_firstname, trainer_lastname, booking_date 
   from personalbookings
   join members on members.member_id=personalbookings.member_id
   join trainers on trainers.trainer_id=personalbookings.trainer_id
   where booking_id.member_id=id;
   end if;
end;
$$;

/*change in group class bookings*/
CREATE FUNCTION schedule_groupclass(id int, option varchar)
returns table(
groupbooking_id int,
member_id int,
first_name varchar,
last_name varchar,
group_class_choice varchar,
booking_date date,
status varchar)
language plpgsql
AS
$$
begin
   if option='SCHEDULE' then
      update groupbookings
      set status=option
      where groupbooking_id=id;
   elsif option='CANCEL' then
      update groupbookings
      set status=option
      where groupbooking_id=id;
   end if;

   return query 
   select groupbooking_id, member_id, first_name, last_name, group_class_choice, booking_date, status
   from groupbookings
   join members on members.member_id=groupbookings.member_id
   where groupbooking_id.member_id=id;
end;
$$;

/*2: TRAINER FUNCTIONS*/

/*update availabilities in trainers schedule*/
CREATE FUNCTION update_availability(id int, new_date date)
returns table(
trainer_id varchar,
first_name varchar,
last_name varchar,
availability_date date)
language plpgsql
AS
$$
begin
   update trainers
   set availability_date = new_date
   where trainers.trainer_id=id;

   return query 
   select trainer_id, first_name, last_name, availability_date
   from trainers
   where trainers.trainer_id=id;
end;
$$;

/*view member profile*/
CREATE FUNCTION view_member_profile(member_name varchar)
returns table(
member_id int,
first_name varchar,
last_name varchar,
email varchar,
phone_number varchar,
goals_id int,
goal_description text,
start_date date,
expected_enddate date,
healthmetrics_id int,
weight int,
height int,
heart_rate int,
blood_pressure int,
recorded_date date)
language plpgsql
AS
$$
begin
   create view member_profile_view as
      select *
      from members
      join healthmetrics on members.member_id=healthmetrics.member_id
      join fitgoals on healthmetrics.member_id=fitgoals.member_id
      where members.first_name=member_name;

   return query 
   select * 
   from member_profile_view
   where members_profile_view.first_name=member_name;
end;
$$;


/*3: ADMIN STAFF FUNCTIONS*/

/*update new room booking*/
CREATE FUNCTION update_roombooking(id int, booking_date date)
returns table(
roombooking_id int,
room_id int,
room_name varchar,
admin_id int, 
date_booked date, 
status varchar)
language plpgsql
AS
$$
begin
      update roombookings
      set date_booked=booking_date
      where roombooking_id=id; 

      return query 
      select roombooking_id, room_id, room_name, admin_id, date_booked, status
      from roombookings
      join rooms on rooms.room_id=roombookings.room_id
      join adminstaff on roombookings.admin_id=adminstaff.admin_id
      where roombookings.roombooking_id=id; 
end;
$$;

/*update equipment*/
CREATE FUNCTION update_equipmentmonitor(id int, option varchar, value date)
returns table(
monitor_id int,
admin_id int,
equipment_id int,
equipment_name varchar,
member_id int,
member_firstname varchar,
borrowed_date date,
returned_date date)
language plpgsql
AS
$$
begin
   if option='RETURN' then
      update equipmentmonitor
      set returned_date = value
      where equipmentmonitor.monitor_id=id;
   elsif option='BORROW' then
      update equipmentmonitor
      set borrowed_date = value
      where equipmentmonitor.monitor_id=id;
   end if;

   return query 
   select monitor_id, admin_id, equipment_id, equipment_name, member_id, member_firstname, borrowed_date, returned_date
   from equipmentmonitor
   join adminstaff on adminstaff.admin_id=equipmentmonitor.admin_id
   join equipmentlist on equipmentlist.equipment_id=equipmonitor.equipment_id
   join members on members.member_id=equipmonitor.member_id
   where equipmentmonitor.monitor_id=id;
end;
$$;

/*update class schedule*/
CREATE FUNCTION update_class_schedule(id int, new_date date)
returns table(
schedule_id int,
groupfit_class_id int,
class_name varchar,
schedule_date date)
language plpgsql
AS
$$
begin
   update classschedule
   set schedule_date = new_date
   where classschedule.schedule_id=id;

   return query 
   select schedule_id, groupfit_class_id, class_name, schedule_date 
   from classschedule
   join groupfitclass on classschedule.groupfit_class_id=groupfitclass_groupfit_class_id
   where classschedule.schedule_id=id;
end;
$$;

/*view member billing*/
CREATE FUNCTION view_member_billing(mem_id int)
returns table(
member_id int,
first_name varchar,
last_name varchar,
email varchar,
phone_number varchar,
bill_id int,
member_firstname varchar,
member_lastname varchar,
bill_category text,
bill_cost int, 
bill_duedate date,
status varchar, 
payment_id int,
firstname varchar, 
lastname varchar, 
payment_type varchar,
credit_card_number varchar)
language plpgsql
AS
$$
begin
   create view member_billing as
      select *
      from members
      join memberbills on members.member_id=memberbills.member_id
      join payment on memberbills.payment_id=payment.payment_id
      where members.member_id=mem_id;

   return query 
   select * 
   from member_billing
   where member_billing.member_id=mem_id;
end;
$$;

/*update payment methods and payments*/
CREATE FUNCTION update_payments(id int, new_status varchar)
returns table(
member_payment_id int,
admin_id int,
member_id int,
member_firstname varchar, 
member_lastname varchar, 
payment_id int,
payment_category text, 
payment_cost int,
status varchar)
language plpgsql
AS
$$
begin
   update memberpayment
   set status=new_status
   where memberpayment.member_payment_id=id;

   return query 
   select member_payment_id, admin_id, member_id, member_firstname, member_lastname, payment_id, payment_category, payment_cost, status
   from memberpayment
   join adminstaff on adminstaff.admin_id=equipmentmonitor.admin_id
   join members on members.member_id=equipmonitor.member_id
   join payment on payment.payment_id=memberpayment.payment_id
   where memberpayment.member_payment_id=id;
end;
$$;