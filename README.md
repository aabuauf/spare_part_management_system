This gem is a tool to create a web page for Spare parts Management system.


This tool will be useful for factories, refineries or any place that has assets and its spare parts. It will be very helpful for maintenance engineers

Database
The database has 5 tables

* 1- Users table 
Name
Email
Password
Super User flag
Belongs to factory

* 2- Factories table
Name
Has many users
Has many spares
Has many equipment

* 3- Equipment table
Tag No.
Manufacture
Belongs to factory
Has many spares

* 4- Spares table
Code
Description
Manufacture
Part No.
Stock Qty
Belongs to factory
Has many equipment

* 5-Bom
Belongs to spare
Belongs to equipment
Qty installed



User shall be unique by using email.Full function of sign up, sign in and sign out. Also can signin using Facbook. After signing in, The website will show the equipment of the factory that the user belongs to. By selecting equipment, another page will be opened for the list of spare the belongs to this equipment. For superusers (Admins), it will show factories and can add/Edit or delete equipment for any factory. 

After selecting Any spare, spare details page will be opened showing more functions in the side navigation bar. User 

Also, in details page, it shows the equipment that belong to this spare which allow you to click on the equipment to go to equipment page. (easy navigation between spares and equipment) .

There is a side navigation bar that will take the user to home, create new spare or logout at anytime.

This tool is very useful for maintenance engineers to be able to track the spare parts they have in stock
