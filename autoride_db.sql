-- 1. KHOI TAO DATABASE
CREATE DATABASE IF NOT EXISTS autoride_db;
USE autoride_db;

-- 2. BANG CARS
CREATE TABLE IF NOT EXISTS Cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    license_plate VARCHAR(20) UNIQUE NOT NULL
);

-- 3. BANG RENTALS (NANG CAP DDL)
CREATE TABLE IF NOT EXISTS Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    rent_date DATETIME NOT NULL,
    return_date DATETIME,
    status ENUM('BOOKED', 'ACTIVE', 'COMPLETED', 'CANCELLED') DEFAULT 'BOOKED',
    security_deposit DECIMAL(10, 2) DEFAULT 0.00,
    late_fee DECIMAL(10, 2) DEFAULT 0.00,
    damage_fee DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id) ON DELETE RESTRICT
);

-- 4. BANG INSPECTIONS (BIEN BAN KIEM TRA XE)
CREATE TABLE IF NOT EXISTS Inspections (
    inspection_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT NOT NULL,
    inspection_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    damage_description TEXT,
    inspector_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id) ON DELETE RESTRICT
);

-- 5. MO PHONG KICH BAN NG HIEP VU (DML)
INSERT INTO Cars (model_name, license_plate) VALUES ('Toyota Camry 2024', '30K-888.88');

-- Khach Nguyen Van A thue xe, dong coc 10.000.000 VNĐ, trang thai ACTIVE
INSERT INTO Rentals (car_id, customer_name, rent_date, status, security_deposit)
VALUES (1, 'Nguyen Van A', '2026-09-20 08:00:00', 'ACTIVE', 10000000.00);

-- Nhan vien kiem tra xe khi tra: Vo den pha trai
INSERT INTO Inspections (rental_id, damage_description, inspector_name)
VALUES (1, 'Vo den pha trai do va quet', 'Kiem tra vien Tran Van B');

-- Cap nhat Rentals: COMPLETED, ghi nhan damage_fee = 2.000.000 VNĐ
UPDATE Rentals
SET status = 'COMPLETED',
    return_date = '2026-09-24 10:00:00',
    late_fee = 0.00,
    damage_fee = 2000000.00
WHERE rental_id = 1;

-- TRUY VAN TINH TIEN HOAN LAI CHO KHACH (Refund = Deposit - LateFee - DamageFee)
SELECT 
    rental_id,
    customer_name,
    security_deposit,
    late_fee,
    damage_fee,
    (security_deposit - late_fee - damage_fee) AS refund_amount
FROM Rentals
WHERE rental_id = 1;
