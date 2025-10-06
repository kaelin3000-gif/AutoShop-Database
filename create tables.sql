CREATE TABLE EMPLOYEE (
    employee_ID varchar(30) PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    emp_phone VARCHAR(15),
    grade VARCHAR(20)
);

CREATE TABLE CUSTOMER (
    customer_ID varchar(30) PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL,
    cust_email VARCHAR(100),
    cust_phoneno VARCHAR(15)
);

CREATE TABLE CAR (
    registration VARCHAR(20) PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    date_of_manufacture DATE,
    customer_ID VARCHAR(30) varchar NOT NULL,
    FOREIGN KEY (customer_ID) REFERENCES CUSTOMER(customer_ID) ON DELETE CASCADE -- deletes in the child table when deleted
);

CREATE TABLE SERVICE (
    service_ID VARCHAR(30) PRIMARY KEY,
    registration VARCHAR(20) NOT NULL, 
    dropoff_date DATE,
    dropoff_time TIME,
    work_required VARCHAR(500),
    next_service DATE,
	milage int,
    FOREIGN KEY (registration) REFERENCES CAR(registration)ON DELETE SET NULL -- If a car is deleted, the registration column in the SERVICE table is set to NULL.
);

CREATE TABLE EMPLOYEE_SERVICE (
    employee_ID varchar(30),
	time_spent TIME,
    service_ID VARCHAR(30),
    CONSTRAINT PK_EMPLOYEE_SERVICE PRIMARY KEY (employee_ID, service_ID),													--If an employee or service is deleted, 
    CONSTRAINT FK_EMPLOYEE_SERVICE_EMPLOYEE FOREIGN KEY (employee_ID) REFERENCES EMPLOYEE(employee_ID) ON DELETE CASCADE,	--, the corresponding rows in EMPLOYEE_SERVICE are automatically removed.
    CONSTRAINT FK_EMPLOYEE_SERVICE_SERVICE FOREIGN KEY (service_ID) REFERENCES SERVICE(service_ID) ON DELETE CASCADE
);

CREATE TABLE EMPLOYEE_UNAVAILABILITY (							--auxilary table
    unavailability_id INT PRIMARY KEY IDENTITY(1,1),
    employee_ID VARCHAR(30) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    reason VARCHAR(255),
    FOREIGN KEY (employee_ID) REFERENCES EMPLOYEE(employee_ID) ON DELETE CASCADE
);