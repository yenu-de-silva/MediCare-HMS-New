-- Medicare Plus Sample Data Script
-- Healthcare Management System Sample Data

USE medicare_plus;

-- Insert Departments
INSERT INTO departments (department_name, description, location, phone) VALUES
                                                                            ('General Medicine', 'General medical consultations and treatments', 'Ground Floor - Wing A', '0112345678'),
                                                                            ('Cardiology', 'Heart and cardiovascular treatments', '2nd Floor - Wing B', '0112345679'),
                                                                            ('Pediatrics', 'Child healthcare and treatments', '1st Floor - Wing A', '0112345680'),
                                                                            ('Orthopedics', 'Bone and joint treatments', '3rd Floor - Wing C', '0112345681'),
                                                                            ('Dermatology', 'Skin and hair treatments', '2nd Floor - Wing A', '0112345682'),
                                                                            ('Neurology', 'Brain and nervous system treatments', '3rd Floor - Wing B', '0112345683'),
                                                                            ('Gynecology', 'Women\'s health and reproductive care', '1st Floor - Wing B', '0112345684'),
('Emergency', '24/7 emergency medical care', 'Ground Floor - Emergency Wing', '0112345685');

-- Insert Doctors
INSERT INTO doctors (doctor_number, first_name, last_name, specialization, qualifications, license_number, phone, email, consultation_fee, available_days, available_hours) VALUES
('DOC001', 'Samantha', 'Perera', 'General Medicine', 'MBBS, MD', 'LIC001', '0771234567', 'samantha.perera@medicareplus.lk', 3000.00, 'Mon,Tue,Wed,Thu,Fri', '08:00-16:00'),
('DOC002', 'Rajesh', 'Fernando', 'Cardiology', 'MBBS, MD Cardiology', 'LIC002', '0771234568', 'rajesh.fernando@medicareplus.lk', 5000.00, 'Mon,Wed,Fri', '09:00-17:00'),
('DOC003', 'Priya', 'Silva', 'Pediatrics', 'MBBS, DCH', 'LIC003', '0771234569', 'priya.silva@medicareplus.lk', 3500.00, 'Mon,Tue,Thu,Fri,Sat', '08:30-16:30'),
('DOC004', 'Chaminda', 'Rathnayake', 'Orthopedics', 'MBBS, MS Orthopedics', 'LIC004', '0771234570', 'chaminda.rathnayake@medicareplus.lk', 4500.00, 'Tue,Wed,Thu,Sat', '08:00-16:00'),
('DOC005', 'Nishani', 'Wickramasinghe', 'Dermatology', 'MBBS, MD Dermatology', 'LIC005', '0771234571', 'nishani.wickramasinghe@medicareplus.lk', 4000.00, 'Mon,Tue,Wed,Fri', '09:00-17:00'),
('DOC006', 'Kasun', 'Jayawardena', 'Neurology', 'MBBS, MD Neurology', 'LIC006', '0771234572', 'kasun.jayawardena@medicareplus.lk', 6000.00, 'Mon,Wed,Thu', '10:00-18:00'),
('DOC007', 'Malini', 'Gunasekara', 'Gynecology', 'MBBS, MS Gynecology', 'LIC007', '0771234573', 'malini.gunasekara@medicareplus.lk', 4500.00, 'Mon,Tue,Thu,Fri,Sat', '08:00-16:00'),
('DOC008', 'Thilak', 'Mendis', 'Emergency Medicine', 'MBBS, Dip Emergency Medicine', 'LIC008', '0771234574', 'thilak.mendis@medicareplus.lk', 3500.00, 'Mon,Tue,Wed,Thu,Fri,Sat,Sun', '00:00-23:59');

-- Link doctors to departments
INSERT INTO doctor_departments (doctor_id, department_id, is_primary) VALUES
(1, 1, TRUE),
(2, 2, TRUE),
(3, 3, TRUE),
(4, 4, TRUE),
(5, 5, TRUE),
(6, 6, TRUE),
(7, 7, TRUE),
(8, 8, TRUE);

-- Update department heads
UPDATE departments SET head_doctor_id = 1 WHERE department_id = 1;
UPDATE departments SET head_doctor_id = 2 WHERE department_id = 2;
UPDATE departments SET head_doctor_id = 3 WHERE department_id = 3;
UPDATE departments SET head_doctor_id = 4 WHERE department_id = 4;
UPDATE departments SET head_doctor_id = 5 WHERE department_id = 5;
UPDATE departments SET head_doctor_id = 6 WHERE department_id = 6;
UPDATE departments SET head_doctor_id = 7 WHERE department_id = 7;
UPDATE departments SET head_doctor_id = 8 WHERE department_id = 8;

-- Insert Staff
INSERT INTO staff (staff_number, first_name, last_name, position, department_id, phone, email, hire_date, salary) VALUES
('STF001', 'Kumari', 'Abeysinghe', 'Head Nurse', 1, '0771234575', 'kumari.abeysinghe@medicareplus.lk', '2020-01-15', 75000.00),
('STF002', 'Ruwan', 'Dissanayake', 'Receptionist', 8, '0771234576', 'ruwan.dissanayake@medicareplus.lk', '2021-03-10', 45000.00),
('STF003', 'Sanduni', 'Ranawaka', 'Nurse', 3, '0771234577', 'sanduni.ranawaka@medicareplus.lk', '2021-06-20', 65000.00),
('STF004', 'Dinesh', 'Gamage', 'Lab Technician', 1, '0771234578', 'dinesh.gamage@medicareplus.lk', '2020-09-05', 55000.00),
('STF005', 'Anushka', 'Wijesinghe', 'Pharmacist', 1, '0771234579', 'anushka.wijesinghe@medicareplus.lk', '2019-11-12', 70000.00);

-- Insert Patients
INSERT INTO patients (patient_number, first_name, last_name, date_of_birth, gender, nic, phone, email, address, emergency_contact_name, emergency_contact_phone, blood_group, allergies) VALUES
('PAT001', 'Kamal', 'Rodrigo', '1985-05-15', 'Male', '198513500123', '0701234567', 'kamal.rodrigo@email.com', 'No. 25, Galle Road, Colombo 03', 'Sumitha Rodrigo', '0701234568', 'O+', 'Penicillin'),
('PAT002', 'Nirosha', 'Jayatilake', '1990-08-22', 'Female', '199024500234', '0701234569', 'nirosha.jayatilake@email.com', 'No. 15, Kandy Road, Kegalle', 'Saman Jayatilake', '0701234570', 'A+', NULL),
('PAT003', 'Amara', 'Senanayake', '2010-12-10', 'Male', '201035000345', '0701234571', NULL, 'No. 45, Main Street, Kurunegala', 'Sunil Senanayake', '0701234572', 'B+', 'Dust allergy'),
('PAT004', 'Dilini', 'Wickramage', '1975-03-08', 'Female', '197506700456', '0701234573', 'dilini.wickramage@email.com', 'No. 78, Temple Road, Matara', 'Chandana Wickramage', '0701234574', 'AB+', NULL),
('PAT005', 'Rohana', 'Gunathilake', '1995-11-30', 'Male', '199533400567', '0701234575', 'rohana.gunathilake@email.com', 'No. 12, Lake View, Anuradhapura', 'Premila Gunathilake', '0701234576', 'O-', 'Aspirin'),
('PAT006', 'Sachini', 'Ranasinghe', '1988-07-18', 'Female', '198820100678', '0701234577', 'sachini.ranasinghe@email.com', 'No. 33, Hill Street, Badulla', 'Rohan Ranasinghe', '0701234578', 'A-', NULL),
('PAT007', 'Tharindu', 'Liyanage', '2005-09-25', 'Male', '200527000789', '0701234579', NULL, 'No. 67, Park Road, Gampaha', 'Wasantha Liyanage', '0701234580', 'B-', 'Shellfish'),
('PAT008', 'Chamali', 'Munasinghe', '1982-01-12', 'Female', '198202300890', '0701234581', 'chamali.munasinghe@email.com', 'No. 89, Colombo Road, Kalutara', 'Mahinda Munasinghe', '0701234582', 'O+', NULL);

-- Insert Appointments
INSERT INTO appointments (appointment_number, patient_id, doctor_id, appointment_date, appointment_time, appointment_type, status, reason) VALUES
('APT001', 1, 1, '2024-02-15', '09:00:00', 'Consultation', 'Completed', 'Regular checkup'),
('APT002', 2, 2, '2024-02-15', '10:30:00', 'Consultation', 'Completed', 'Chest pain'),
('APT003', 3, 3, '2024-02-16', '14:00:00', 'Follow-up', 'Completed', 'Follow-up for fever'),
('APT004', 4, 5, '2024-02-16', '11:00:00', 'Consultation', 'Completed', 'Skin rash'),
('APT005', 5, 4, '2024-02-17', '09:30:00', 'Consultation', 'Completed', 'Knee pain'),
('APT006', 6, 7, '2024-02-17', '15:00:00', 'Consultation', 'Completed', 'Pregnancy checkup'),
('APT007', 1, 1, '2024-02-20', '10:00:00', 'Follow-up', 'Scheduled', 'Follow-up appointment'),
('APT008', 7, 6, '2024-02-21', '16:00:00', 'Consultation', 'Confirmed', 'Headaches');

-- Insert Medical Records
INSERT INTO medical_records (patient_id, doctor_id, appointment_id, visit_date, chief_complaint, diagnosis, treatment, prescription, vital_signs, notes) VALUES
(1, 1, 1, '2024-02-15', 'Regular health checkup', 'Generally healthy, mild hypertension', 'Lifestyle modifications', 'Amlodipine 5mg daily', '{"bp": "140/90", "temp": "98.4", "pulse": "78", "weight": "75"}', 'Patient advised to reduce salt intake and exercise regularly'),
(2, 2, 2, '2024-02-15', 'Chest pain and shortness of breath', 'Angina pectoris', 'Medication and lifestyle changes', 'Atorvastatin 20mg, Aspirin 75mg', '{"bp": "150/95", "temp": "98.6", "pulse": "88", "weight": "68"}', 'ECG shows mild abnormalities. Patient referred for stress test'),
(3, 3, 3, '2024-02-16', 'Follow-up for viral fever', 'Recovered from viral infection', 'Continue rest and hydration', 'Paracetamol as needed', '{"bp": "110/70", "temp": "98.2", "pulse": "72", "weight": "35"}', 'Child has recovered well. No fever for 2 days'),
(4, 5, 4, '2024-02-16', 'Itchy skin rash on arms', 'Contact dermatitis', 'Topical steroid cream', 'Betamethasone cream twice daily', '{"bp": "120/80", "temp": "98.6", "pulse": "75", "weight": "55"}', 'Avoid contact with potential allergens'),
(5, 4, 5, '2024-02-17', 'Knee pain after jogging', 'Mild knee strain', 'Rest and physiotherapy', 'Ibuprofen 400mg twice daily', '{"bp": "125/85", "temp": "98.4", "pulse": "70", "weight": "82"}', 'Patient advised to avoid running for 2 weeks');

-- Insert Medications
INSERT INTO medications (medication_name, generic_name, manufacturer, dosage_form, strength, unit_price, stock_quantity, expiry_date) VALUES
('Amlodipine', 'Amlodipine Besylate', 'Cipla Ltd', 'Tablet', '5mg', 15.00, 500, '2025-12-31'),
('Atorvastatin', 'Atorvastatin Calcium', 'Pfizer', 'Tablet', '20mg', 25.00, 300, '2025-10-15'),
('Aspirin', 'Acetylsalicylic Acid', 'Bayer', 'Tablet', '75mg', 8.00, 1000, '2026-03-20'),
('Paracetamol', 'Acetaminophen', 'GSK', 'Tablet', '500mg', 5.00, 2000, '2025-08-30'),
('Betamethasone Cream', 'Betamethasone Valerate', 'Johnson & Johnson', 'Cream', '0.1%', 120.00, 50, '2025-06-15'),
('Ibuprofen', 'Ibuprofen', 'Abbott', 'Tablet', '400mg', 12.00, 800, '2025-11-25'),
('Amoxicillin', 'Amoxicillin Trihydrate', 'Cipla Ltd', 'Capsule', '500mg', 18.00, 400, '2025-09-10'),
('Metformin', 'Metformin Hydrochloride', 'Novartis', 'Tablet', '500mg', 20.00, 600, '2025-07-18');

-- Insert Lab Tests
INSERT INTO lab_tests (test_name, test_category, normal_range, unit, price) VALUES
('Complete Blood Count', 'Hematology', 'Various ranges', 'Various', 1500.00),
('Blood Sugar (Fasting)', 'Biochemistry', '70-100', 'mg/dL', 500.00),
('Lipid Profile', 'Biochemistry', 'Various ranges', 'mg/dL', 2000.00),
('Liver Function Test', 'Biochemistry', 'Various ranges', 'U/L', 1800.00),
('Kidney Function Test', 'Biochemistry', 'Various ranges', 'mg/dL', 1200.00),
('Thyroid Function Test', 'Endocrinology', 'Various ranges', 'mIU/L', 2500.00),
('Urine Analysis', 'Microbiology', 'Normal', 'Various', 800.00),
('ECG', 'Cardiology', 'Normal rhythm', 'N/A', 1000.00);

-- Insert Bills
INSERT INTO bills (bill_number, patient_id, appointment_id, bill_date, subtotal, discount, tax, total_amount, payment_status, payment_method) VALUES
('BILL001', 1, 1, '2024-02-15', 3000.00, 0.00, 0.00, 3000.00, 'Paid', 'Cash'),
('BILL002', 2, 2, '2024-02-15', 5000.00, 500.00, 0.00, 4500.00, 'Paid', 'Card'),
('BILL003', 3, 3, '2024-02-16', 3500.00, 0.00, 0.00, 3500.00, 'Paid', 'Cash'),
('BILL004', 4, 4, '2024-02-16', 4000.00, 0.00, 0.00, 4000.00, 'Paid', 'Insurance'),
('BILL005', 5, 5, '2024-02-17', 4500.00, 0.00, 0.00, 4500.00, 'Pending', 'Cash');

-- Insert Bill Items
INSERT INTO bill_items (bill_id, service_type, description, quantity, unit_price, total_price) VALUES
(1, 'Consultation', 'General Medicine Consultation', 1, 3000.00, 3000.00),
(2, 'Consultation', 'Cardiology Consultation', 1, 5000.00, 5000.00),
(3, 'Consultation', 'Pediatrics Follow-up', 1, 3500.00, 3500.00),
(4, 'Consultation', 'Dermatology Consultation', 1, 4000.00, 4000.00),
(5, 'Consultation', 'Orthopedics Consultation', 1, 4500.00, 4500.00);

-- Insert System Users
INSERT INTO users (username, email, password_hash, user_type, doctor_id, staff_id) VALUES
('dr.samantha', 'samantha.perera