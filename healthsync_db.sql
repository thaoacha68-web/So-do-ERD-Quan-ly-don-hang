-- 1. KHOI TAO DATABASE
CREATE DATABASE IF NOT EXISTS healthsync_db;
USE healthsync_db;

-- 2. TAO BANGpatients VA Doctors
CREATE TABLE IF NOT EXISTS Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(50)
);

-- 3. TAO BANG Appointments VOI CAU TRUC CHUAN NG HIEP VU
CREATE TABLE IF NOT EXISTS Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('PENDING', 'CONFIRMED', 'CHECKED_IN', 'COMPLETED', 'CANCELLED') DEFAULT 'PENDING',
    deposit_amount DECIMAL(10, 2) DEFAULT 0.00,
    penalty_fee DECIMAL(10, 2) DEFAULT 0.00,
    cancel_reason VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- 4. TAO BANG Prescriptions (DON THUOC)
CREATE TABLE IF NOT EXISTS Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE NOT NULL,
    medication_details TEXT NOT NULL,
    issued_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- 5. KICH BAN DU LIEU THUC TE (DML)
INSERT INTO Patients (full_name, phone) VALUES ('Nguyen Van A', '0901234567'), ('Tran Thi B', '0987654321');
INSERT INTO Doctors (full_name, specialty) VALUES ('Bac si Le C', 'Noi khoa');

-- Kich ban 1: Dat lich thanh cong -> Khen don thuốc
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, deposit_amount) 
VALUES (1, 1, '2026-10-01 09:00:00', 'PENDING', 500000.00);

UPDATE Appointments SET status = 'CHECKED_IN' WHERE appointment_id = 1;
UPDATE Appointments SET status = 'COMPLETED' WHERE appointment_id = 1;

INSERT INTO Prescriptions (appointment_id, medication_details) 
VALUES (1, 'Paracetamol 500mg - 10 vien, Amoxicillin 500mg - 14 vien');

-- Kich ban 2: Huy lich va phat tien coc
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, deposit_amount) 
VALUES (2, 1, '2026-10-02 14:00:00', 'CONFIRMED', 300000.00);

UPDATE Appointments 
SET status = 'CANCELLED', cancel_reason = 'Ban viec dot xuat', penalty_fee = 150000.00 
WHERE appointment_id = 2;
