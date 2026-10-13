# Cafe Management System

**Cafe Management System** is a Java Swing desktop application for cafe operations. The project is fully English and uses a real MySQL/MariaDB database through JDBC. It is intended to be opened and run in Apache NetBeans.

## Main Features

- User login and password reset
- Employee dashboard
- Employee attendance recording and history
- Sales transaction / point-of-sale screen
- Product search and category filtering
- Shopping cart with quantity controls
- Member customer discounts
- Ingredient stock tracking and automatic stock reduction
- MySQL/MariaDB persistent data storage

## OOP Concepts

- **Encapsulation:** customer fields are private and accessed through methods.
- **Inheritance:** `MemberCustomer` and `RegularCustomer` extend `Customer`.
- **Abstraction:** `Customer` is an abstract class.
- **Polymorphism:** subclasses override `calculateDiscount()`.

## Core Java Concepts

Classes and objects, constructors, `if/else`, loops, `ArrayList`, exception handling, Java Swing event handling, JDBC, `PreparedStatement`, and `ResultSet`.

## Technology

- Java 17+
- Apache NetBeans
- Java Swing
- JDBC
- MySQL or MariaDB (XAMPP compatible)
- MySQL Connector/J included in `lib/`

## Database

Database file: `cafe_management_system_db.sql`

Database name: `cafe_management_system_db`

Default connection in `src/features/DatabaseConnection.java`:

- Host: `localhost`
- Port: `3306`
- User: `root`
- Password: empty

The SQL uses `utf8mb4_general_ci`, which is compatible with MariaDB 10.4/XAMPP as well as common MySQL installations.

## Login

Primary sample account:

- Username: `admin`
- Password: `123`

Additional sample account:

- Username: `owner`
- Password: `123`

## Run in NetBeans

1. Start MySQL/MariaDB.
2. Import `cafe_management_system_db.sql` using phpMyAdmin, MySQL Workbench, or the command line.
3. Open Apache NetBeans.
4. Choose **File > Open Project** and select the `Cafe_Management_System` folder.
5. Run the project. Main class: `features.LoginPanel`.
6. Login with `admin / 123`.

## Important Files

- `src/features/LoginPanel.java` - login
- `src/features/EmployeeDashboard.java` - dashboard
- `src/features/AttendancePanel.java` - attendance
- `src/features/SalesTransaction.java` - sales/POS
- `src/features/Customer.java` - abstract base class
- `src/features/MemberCustomer.java` - member subclass
- `src/features/RegularCustomer.java` - regular customer subclass
- `src/features/DatabaseConnection.java` - JDBC database connection
- `cafe_management_system_db.sql` - database schema and sample data

## Source Attribution

The application was adapted from the open Java Swing project previously named **SiKongkow**. The original project README credited Geral Tritama Wahyuady, Nugraha Adani, Ambar Triyasmin, and Raika Maulana (Singaperbangsa University, Informatics). This Cafe Management System version contains English naming, database compatibility updates, OOP examples, and project-specific fixes.
