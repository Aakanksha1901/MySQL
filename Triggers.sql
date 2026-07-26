CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Patients(
PatientID INT PRIMARY KEY ,
PatientName VARCHAR(50), 
Age INT, 
Gender VARCHAR(10), 
City VARCHAR(30),
Disease VARCHAR(50),
DoctorName VARCHAR(50),
BillAmount DECIMAL(10, 2)
);

INSERT INTO Patients VALUES
(101, 'Aarav'  , 25, 'Male', 'Pune', 'Fever', 'Dr.Sharma', 2500),
(102, 'Siya'   , 31, 'Female', 'Mumbai', 'Diabetis' ,'Dr.Mehta', 7000),
(103, 'Vivaan' , 45, 'Male', 'Nagpur','Heart Disease', 'Dr.Patel', 15000),
(104, 'Anaya'  , 28, 'Female','Pune','Migrane','Dr.Sharma',4000),
(105, 'Kabir'  , 35, 'Male','Delhi','Diabetis','Dr.Mehta',8500),
(106, 'Ishita' , 22, 'Female','Mumbai','Fever','Dr.Joshi',2000),
(107, 'Reyansh', 50, 'Male','Pune','Heart Disease', 'Dr.Patel',18000),
(108, 'Diya'   , 29,'Female','Nagpur','Allergy','Dr.Joshi',3000),
(109, 'Arjun'  , 40,'Male','Delhi','Diabetis','Dr.Mehta',9500),
(110, 'Myra'   , 27,'Female','Pune','Fever','Dr.Sharma',2800);

SELECT * FROM Patients;

-- CREATE TRIGGER TO STORE DELETED PATIENT DETAILS IN PatientBackup
CREATE TABLE PatientBackup(
PatientID INT ,
PatientName VARCHAR(50), 
Age INT, 
Gender VARCHAR(10), 
City VARCHAR(30),
Disease VARCHAR(50),
DoctorName VARCHAR(50),
BillAmount DECIMAL(10, 2)
);
 
DELIMITER //

CREATE TRIGGER BackupPatient
BEFORE DELETE
ON Patients
FOR EACH ROW
BEGIN
    INSERT INTO PatientBackup
    VALUES(
        OLD.PatientID,
        OLD.PatientName,
        OLD.Age,
        OLD.Gender,
        OLD.City,
        OLD.Disease,
        OLD.DoctorName,
        OLD.BillAmount
    );
END //

DELIMITER ;

DESCRIBE Patients;

-- Test Trigger

DELETE FROM Patients
WHERE PatientID = 110;

SELECT * FROM PatientBackup;

-- CREATE TRIGGER TO PREVENT BILL AMOUNT BELOW 1000

DELIMITER //
 
CREATE TRIGGER CheckBill
  BEFORE INSERT
  ON Patients
  FOR EACH ROW
  BEGIN
  
  IF NEW.BillAmount<1000 THEN
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = 'Bill Amount cannot be below 1000' ;
  
  END IF;
  
END //

DELIMITER ;

-- Create triigger that records update in Bill amount

CREATE TABLE BillLog(
PatientID INT, 
OldBill DECIMAL (10,2),
NewBill DECIMAL(10, 2)
);

DELIMITER //

CREATE TRIGGER UpdateBill
AFTER UPDATE
ON Patients
FOR EACH ROW
BEGIN

INSERT INTO BillLog
VALUES(
OLD.PatientID ,
OLD.BillAmount,
NEW.BillAmount);

END //

 DELIMITER ;

-- Test Trigger

UPDATE Patients
SET BillAmount = 5000
WHERE PatientID = 101 ;

SELECT * FROM BillLog;

-- Create trigger to automaticcaly insert patient entry logs

CREATE TABLE PatientLogs(
Message VARCHAR(100)
);

-- CREATE a trigger to display a message after inserting a patient

DELIMITER //
CREATE TRIGGER DisplayMessage
AFTER INSERT
ON Patients
FOR EACH ROW
BEGIN

INSERT INTO PatinetLogs
VALUES('Record Inserted :');

END//

DELIMITER ;

SELECT 
    *
FROM
    PatientLogs;

INSERT INTO Patients VALUES 
(111, 'Arnav', 25, 'Male', 'Pune', 'Cold', 'Dr.Sharma', 1500);