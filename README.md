# 🚗 AutoShop Database Management System

The **AutoShop Database System** is a relational database designed to manage employees, customers, vehicles, and repair services for an automotive workshop.  
It demonstrates database design, SQL development, and procedural logic through the use of **tables, constraints, stored procedures, and triggers**.

---

## 🧩 Overview
This project simulates a real-world car service and repair shop.  
It stores and manages information about customers, cars, mechanics, and scheduled services while enforcing business rules through SQL Server constraints and triggers.

---

## 🗃️ Database Structure

### **Main Tables**
| Table | Description |
|--------|--------------|
| **EMPLOYEE** | Stores employee information (mechanics, apprentices, etc.) |
| **CUSTOMER** | Holds customer details such as name, email, and phone number |
| **CAR** | Links each vehicle to its owner (customer) |
| **SERVICE** | Stores details of car services (dates, times, and work required) |
| **EMPLOYEE_SERVICE** | Many-to-many relationship linking mechanics to services |
| **EMPLOYEE_UNAVAILABILITY** | Tracks periods when mechanics are unavailable |

Each table includes **primary and foreign keys**, **ON DELETE CASCADE** rules, and **data integrity constraints**.

---

## ⚙️ Key SQL Features

### **Stored Procedures**
- `pro_GetCustomerCars.sql` → Returns all cars belonging to a specific customer.  
- `pro_GetServicesByMechanic.sql` → Lists all services assigned to a specific mechanic.  
- `pro_AssignMechanicToService.sql` → Assigns a mechanic to a service while checking their availability.  

### **Trigger**
- `trg_Prevent_service_overlap.sql` → Prevents assigning a mechanic to a service if they’re marked unavailable during that date range.

---

## 🧱 Data Population
Initial data is inserted using the provided scripts:
- `create tables.sql` → Builds all required tables and relationships.  
- `insert data.sql` → Populates the database with employees, customers, cars, and service records.  

The sample data includes **realistic automotive scenarios**, such as MOT check-ups, annual services, and repair requests.

---

## 🧠 Technologies Used
| Component | Technology |
|------------|-------------|
| **Database Engine** | Microsoft SQL Server |
| **Language** | Transact-SQL (T-SQL) |
| **Data Model** | Relational schema with foreign key constraints |
| **Procedures & Triggers** | Implemented using SQL Server stored logic |
