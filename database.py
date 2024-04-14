#connect the to the postgresql database through this
import psycopg2
import emoji
import fontstyle

#create the functions for implementing the main function
#use callproc(function name, (value1, value2, etc))
def members_menu(cursor):
    #print opening statement and give the option if a new member or exisiting member
    print("Welcome to the Members Portal! Follow instructions for access to new changes!")
    print("------------------------------------------------------------------------------------------------------")
    print("Here are the menu options:")
    print("1. User Registration")
    print("2. Profile Management")
    print("3. Dashboard Display")
    print("4. Scheduling")
    print("0. Exit")
    print("------------------------------------------------------------------------------------------------------")
    member = int(input("Enter your menu option: "))
    if(member==1):
        #call user registration
        id = int(input("Enter your a new unique id number: "))
        fname = input("Enter your first name: ")
        lname = input("Enter your last name: ")
        email = input("Enter your email: ")
        phone = input("Enter your phone number: ")
        print("------------------------------------------------------------------------------------------------------")

        cursor.callproc('user_registration', (id, fname, lname, email, phone)) 
        connection.commit()
        output = cursor.fetchall()
        columns = [i[0] for i in cursor.description]
        print("Members")
        print(columns)
        print(output)
    #if existing member, call other function in database
    elif(member==2):
        print("1. Update Personal Information")
        print("2. Update Fitness Goals")
        print("3. Update Health Metrics")
        print("0. Exit")
        print("------------------------------------------------------------------------------------------------------")
        choice = int(input("Enter your menu option: "))
        if(choice == 1):
            mid = int(input("Enter your 'member_id' number: "))
            print("You can update these options:")
            print("first_name, last_name, email, phone_number")
            option = input("What do you want to update? Type in the exact format of the options: ")
            val1 = input("What value will you put for this? ")

            cursor.callproc('update_personal_info', (mid, option, val1)) 
            connection.commit()
            print("------------------------------------------------------------------------------------------------------")

            #this grabs all the rows and data and puts on read mode to read the data
            output1 = cursor.fetchall()
            columns1 = [i[0] for i in cursor.description]
            print("Members")
            print(columns1)
            print(output1)

        elif(choice == 2):
            mid1 = int(input("Enter your 'member_id' number: "))
            goal = input("What is your fitness goal? ")

            cursor.callproc('update_fitnessgoals', (mid1, goal)) 
            connection.commit()
            print("------------------------------------------------------------------------------------------------------")

            output2 = cursor.fetchall()
            columns2 = [i[0] for i in cursor.description]
            print("Fitness Goals")
            print(columns2)
            print(output2)

        elif(choice == 3):
            hmid = int(input("Enter your 'member_id' number: "))
            print("You can update these options:")
            print("weight, height, heart_rate, blood_pressure")
            option1 = input("What do you want to update? Type in the exact format of the options: ")
            val2 = int(input("What integer value will you put for this? "))

            cursor.callproc('update_healthmetrics', (hmid, option1, val2)) 
            connection.commit()
            print("------------------------------------------------------------------------------------------------------")

            output3 = cursor.fetchall()
            columns3 = [i[0] for i in cursor.description]

            print("Health Metrics")
            print(columns3)
            print(output3)

        elif(choice == 0):
            print("Exiting the Member's Portal")
            exit()

    #Dashboard display
    elif(member==3):
        #ask user input
        member_id = int(input("Enter your 'member_id' number: "))
        cursor.callproc('display_exercise', (member_id))
        connection.commit()
        output4 = cursor.fetchall()
        columns4 = [i[0] for i in cursor.description]
        print("Member Routines")
        print(columns4)
        print(output4)

        cursor.callproc('display_achievements', (member_id))
        connection.commit()
        output5 = cursor.fetchall()
        columns5 = [i[0] for i in cursor.description]
        print("Achievements")
        print(columns5)
        print(output5)

        cursor.callproc('display_healthstats', (member_id))
        connection.commit()
        output6 = cursor.fetchall()
        columns6 = [i[0] for i in cursor.description]
        print("Health Statistics")
        print(columns6)
        print(output6)

    elif(member==4):
        mid2 = int(input("Enter your 'member_id' number: "))
        type = int(input("Do you want to schedule for personal training or group class? Type 1 for personal or 2 for group: "))
        if(type == 1):
            option2 = input("Do you want to SCHEDULE OR CANCEL? Type the exact format of the 2 options: ")
            cursor.callproc('scheduling_personaltraining', (mid2, option2))
            connection.commit()
            output7 = cursor.fetchall()
            columns7 = [i[0] for i in cursor.description]

            print("Personal Training")
            print(columns7)
            print(output7)

        elif(type == 2):
            option3 = input("Do you want to SCHEDULE OR CANCEL? Type the exact format of the 2 options: ")
            cursor.callproc('schedule_groupclass', (mid2, option3))
            connection.commit()
            output7 = cursor.fetchall()
            columns7 = [i[0] for i in cursor.description]

            print("Personal Training")
            print(columns7)
            print(output7)

    elif(member==0):
        print("Exiting the Member's Portal")
        exit()

def trainers_menu(cursor):
    #print opening statement and give options on what they want to do 
    print("Welcome to the Trainers Portal! Follow instructions for access to new changes!")
    print("------------------------------------------------------------------------------------------------------")
    print("Here are the menu options:")
    print("1. Scheduling Management")
    print("2. Member Profiles")
    print("0. Exit")
    print("------------------------------------------------------------------------------------------------------")
    trainer = int(input("Enter your menu option: "))
    if(trainer==1):
        #call update scheduling
        trainer_id = int(input("Enter your 'trainer_id' number: "))
        date = input("Enter a new date to schedule your availability (eg.YYYY-MM-DD): ")
        cursor.callproc('update_availability', (trainer_id, date))
        print("------------------------------------------------------------------------------------------------------")

        connection.commit()
        output8 = cursor.fetchall()
        columns8 = [i[0] for i in cursor.description]
        print("Personal Training")
        print(columns8)
        print(output8)

    elif(trainer==2):
        trainer_id = int(input("Enter your 'trainer_id' number: "))
        mem_name = input("Enter the member's name you want to search. Use the exact format (e.g Lina, Annie, etc): ")
        cursor.callproc('view_member_profile', (trainer_id, mem_name))
        print("------------------------------------------------------------------------------------------------------")

        connection.commit()
        output9 = cursor.fetchall()
        columns9 = [i[0] for i in cursor.description]
        print("Personal Training")
        print(columns9)
        print(output9)
    #if want to schedule management, call update function for their profiles
    elif(trainer==0):
        print("Exiting Trainer's Portal")
        exit()

def admin_menu(cursor):
    #print opening statement and give options as to what the admin wants to do
    print("Welcome to the Administrative Staff Portal! Follow instructions for access to new changes!")
    print("------------------------------------------------------------------------------------------------------")
    print("Here are the menu options:")
    print("1. Room Booking")
    print("2. Equipment Maintenance")
    print("3. Class Scheduling")
    print("4. Billing and Payment")
    print("0. Exit")
    print("------------------------------------------------------------------------------------------------------")
    admin = int(input("Enter your menu option: "))
    if(admin==1):
        roombooking_id = int(input("Enter your 'roombooking_id' number: "))
        date1 = input("Enter a new date to book (eg.YYYY-MM-DD): ")
        cursor.callproc('update_roombooking', (roombooking_id, date1))
        print("------------------------------------------------------------------------------------------------------")

        connection.commit()
        output10 = cursor.fetchall()
        columns10 = [i[0] for i in cursor.description]
        print("Room Booking")
        print(columns10)
        print(output10)

    elif(admin==2):
        monitor_id = int(input("Enter your 'monitor_id' number: "))
        option3 = input("Enter either RETURN or BORROW: ")
        date2 = input("Enter a a new date (eg.YYYY-MM-DD): ")
        cursor.callproc('update_equipmentmonitor', (monitor_id, option3, date2))
        print("------------------------------------------------------------------------------------------------------")

        connection.commit()
        output12 = cursor.fetchall()
        columns12 = [i[0] for i in cursor.description]
        print("Equipment Monitor")
        print(columns12)
        print(output12)

    elif(admin==3):
        schedule_id = int(input("Enter your 'schedule_id' number: "))
        date3 = input("Enter a new date to book (eg.YYYY-MM-DD): ")
        cursor.callproc('update_class_schedule', (schedule_id, date3))

        print("------------------------------------------------------------------------------------------------------")

        connection.commit()
        output11 = cursor.fetchall()
        columns11 = [i[0] for i in cursor.description]
        print("Class Scheduling")
        print(columns11)
        print(output11)

    elif(admin==4):
        bill_or_pay = input("Do you want to check bills or payments first? Enter 'bill' or 'pay': ")
        if(bill_or_pay == 'bill'):
            mid4 = int(input("Enter your the 'member_id' number you want to search for: "))
            cursor.callproc('view_member_billing', (mid4))

            print("------------------------------------------------------------------------------------------------------")

            connection.commit()
            output13 = cursor.fetchall()
            columns13 = [i[0] for i in cursor.description]
            print("Member Billing")
            print(columns13)
            print(output13)

        if(bill_or_pay == 'pay'):
            member_payment_id = int(input("Enter your 'member_payment_id' number: "))
            new_status = input("Enter a new status in CAPS: ")
            cursor.callproc('update_payments', (member_payment_id, new_status))
            print("------------------------------------------------------------------------------------------------------")

            connection.commit()
            output15 = cursor.fetchall()
            columns15 = [i[0] for i in cursor.description]
            print("Member Payment")
            print(columns15)
            print(output15)

    elif(admin==0):
        print("Exiting the Administrative Staff's Portal")
        exit()
        
try:
    #replace credentials with your own 
    connection = psycopg2.connect(database="healthandfitness", user = "postgres", password = "postgres", port = "5432")
    #create cursor movement
    cursor = connection.cursor()
    #showcase title designs
    man_lifting = emoji.emojize(":man_lifting_weights:")
    volleyball = emoji.emojize(":volleyball:")
    title_design = fontstyle.apply('Welcome to the Stars Health and Fitness Club Management System!', 'faint/white/CYAN_BG')

    print(man_lifting + title_design + volleyball)
    print("------------------------------------------------------------------------------------------------------")
    print("We're happy to have you here! We welcome all new people to join us in keeping our club safe and healthy")
    print("Please follow instructions in order to cooperate with the system. We hope you enjoy your time with us!")
    print("------------------------------------------------------------------------------------------------------")
    print("Here are the menu options:")
    print("1. Members Portal")
    print("2. Trainers Portal")
    print("3. Administrative Staff Portal")
    print("0. Exit")
    print("------------------------------------------------------------------------------------------------------")

    user_input = int(input("Please enter one of the following menu options listed above: "))
    exit = 0
    while(user_input != 0):
        if user_input == 1:
            #call member registration functions here
            members_menu(cursor)
            break
        elif user_input == 2:
            trainers_menu(cursor)
            break
        elif user_input == 3:
            admin_menu(cursor)
            break
except:
    raise Exception("ERROR: Database does not exist")

finally:
    #add in close database connection
    cursor.close()
    connection.close()
    print("DISCONNECTED")        
    print("Thank you for your cooperation and service! Have a great day!")