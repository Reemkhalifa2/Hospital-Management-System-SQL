CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE Doctor(
Doctor_Id int Primary Key,
Doctor_name varchar(20),
Email varchar(20),
Specilization varchar(20),
Experience_year int,
Qualification varchar(20),
Licence_No varchar(20),
Super_Id int,
FOREIGN KEY (Super_Id)
REFERENCES Doctor(Doctor_Id)
);

CREATE TABLE Docotr_Phone(
Doctor_Id int,
Phone_number varchar(20),
PRIMARY KEY(Doctor_Id, Phone_number),
FOREIGN KEY (Doctor_Id)
REFERENCES Doctor(Doctor_Id)
);

CREATE TABLE Department(
Dnum int PRIMARY KEY,
Dnam varchar(20),
Loc varchar(20),
Manager_id int,
FOREIGN KEY (Manager_id)
REFERENCES Doctor(Doctor_Id)
);

ALTER TABLE Doctor
ADD Dnum int;

ALTER TABLE Doctor
ADD CONSTRAINT fk_department
FOREIGN KEY (Dnum)
REFERENCES Department(Dnum);

CREATE TABLE Service(
Service_Id int PRIMARY KEY,
Serv_name varchar(20),
Dnum int,
Serv_Description varchar(100),
Price DECIMAL(10,2),
Serv_Type varchar(20),
FOREIGN KEY (Dnum)
REFERENCES Department(Dnum)
);

CREATE TABLE Patient (
    Patient_id INT PRIMARY KEY,
    F_name VARCHAR(50),
    L_name VARCHAR(50),
    Phone_no VARCHAR(20),
    Email VARCHAR(100),
    Address VARCHAR(200),
    DOB DATE,
    Blood_group VARCHAR(5),
    Gender CHAR(1)
);

CREATE TABLE Patient_Phone(
Patient_id int,
Phone_number varchar(20),
PRIMARY KEY(Patient_id, Phone_number),
FOREIGN KEY (Patient_id)
REFERENCES Patient(Patient_id)
);

CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_Date DATE,
    Appointment_Time TIME,
    Status VARCHAR(20),
    Appointment_Type VARCHAR(20),
    Reason VARCHAR(255),

    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

CREATE TABLE Appointment_service (
    Appointment_ID INT PRIMARY KEY,
    Service_ID INT,
    Quantity INT,

    FOREIGN KEY (Service_ID)
    REFERENCES Service(Service_Id)
);

CREATE TABLE Bills (
    Bill_ID INT PRIMARY KEY,
    Patient_ID INT,
    Appointment_ID INT,
    Bill_Date DATE,
    Total_Amount DECIMAL(10,2),
    Payment_Status VARCHAR(20),
    Payment_Method VARCHAR(20),
    Due_Date DATE,

    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID)
);

CREATE TABLE Medical_Records (
    Record_ID INT PRIMARY KEY IDENTITY(1,1),
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_ID INT,
    Visit_Date DATE,
    Diagnosis VARCHAR(255),
    Treatment_Plan VARCHAR(255),
    Prescribed_Medications VARCHAR(255),
    Doctor_Notes VARCHAR(255),
    Follow_Up_Required BIT,

    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID)
);


