# Online-Shopping-Cart-Database-Project
## Overview
This project capitalizes on the rapid expansion of the e-commerce sector, aiming to build an internet-based application that offers customers the convenience of signing up and purchasing items online. The project focuses on creating a seamless and user-friendly experience for customers in the e-commerce realm.

## Features
The following features are essential components of this e-commerce application:

1. User Registration System  
    - During the registration process, users will need to provide a unique user ID and password.
    - This feature ensures secure access to the application and personalized user experiences.<br><br>
2. Automated Billing
    - Every time a user makes a purchase, an automated bill will be generated.
    - The bill's calculation is based on the quantity of purchased items, their prices, and any applicable discounts.
    - This feature aims to provide transparency and accurate invoicing to customers.
## Project Setup
1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Install the necessary dependencies using [dependency manager/tool].
4. Run the application.
## How to Use
1. Access the application by [specify how users can access the application].
2. Register with a unique user ID and password to start browsing products.
3. Browse the available items and add desired products to your cart.
4. Proceed to checkout to view the automated bill based on your purchases.
5. Complete the transaction by making payment through specified payment method.
## Future Enhancements
1. Integration of a wider variety of products to expand the product catalog.
2. Implementation of a user profile page for order history and preferences.
3. Integration of real-time payment gateways for secure and convenient transactions.
## Project Summary
### Entities

* User (__userId__, name, phoneNum)
* Buyer (__userId__)
* Seller (__userId__)
* Bank Card (__cardNumber__, userId, bank, expiryDate)
* Credit Card (__cardNumber__, organization)
* Debit Card (__cardNumber__)
* Store (__sid__, name, startTime, customerGrade, streetAddr, city, province)
* Product (__pid__, sid, name, brand, type, amount, price, colour, customerReview, modelNumber)
* Order Item (__itemid__, pid, price, creationTime)
* Order (__orderNumber__, creationTime, paymentStatus, totalAmount)
* Address (__addrid__, userid, name, city, postalCode, streetAddr, province, contactPhoneNumber)

### Relationships

* Manage (__userid__, __sid__, SetupTime) (userid ref Seller, sid ref Store)
* Save to Shopping Cart (__userid__, __pid__, quantity, addtime) (userid ref Buyer, pid ref Product)
* Contain (__orderNumber__, __itemid__, quantity) (orderNumber ref Order, itemid ref Order Item)
* Deliver To (__addrid__, __orderNumber__, TimeDelivered) (addrid ref Address, orderNumber ref Order)
* Payment (__C.cardNumber__, __orderNumber__, payTime) (C.cardNumber ref Credit Card, orderNumber ref Order)

## Create Database

* [Table.sql](Table.sql): Create tables for entities and relationships above.
* [Insert.sql](Insert.sql): Insert datas into tables.
* [Modification.sql](Modification.sql): Modify the data.

## Java GUI

[simpleJDBCPostgres.java](simpleJDBCPostgres.java) is only a sample Java to link the Postgresql JDBC driver and connect to the database for your reference.

[SQL.java](Java_GUI/SQL.java) is the acutal program that we wrote to submit the sql execution to the database based on the sample above.

[Java_GUI](Java_GUI) contains the Java programs for creating the GUI.

1. [MainFrame.java](Java_GUI/MainFrame.java): Provide main menu for user to choose different function.


2. [Register.java](Java_GUI/Register.java): User registration interface.


3. [Login.java](Java_GUI/Login.java): User log-in interface.


4. [AddAddress.java](Java_GUI/AddAddress.java): Add address for delivery.


5. [SearchFrame.java](Java_GUI/SearchFrame.java):Search products in database.


6. [SaveToCartFrame.java](Java_GUI/SaveToCartFrame.java): Add products into shopping cart.


7. [SetUpOrderFrame.java](Java_GUI/SetUpOrderFrame.java): View the shopping cart and create the order.


8. [addressFrame.java](Java_GUI/addressFrame.java): Select a delivery address and finish the shopping.



