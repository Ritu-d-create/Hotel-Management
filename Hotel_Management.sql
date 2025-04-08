/* Data Definition Statements */

/*CREATE DATABASE HotelManagement;
USE HotelManagement;*/
/* Create the guests table with UNIQUE constraints for email and phone */
/* CREATE TABLE guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(20) UNIQUE,   -- Ensure phone numbers are unique
    address VARCHAR(255),
    email VARCHAR(100) UNIQUE   -- Ensure emails are unique
); */

/* CREATE TABLE Rooms (
    Room_ID INT AUTO_INCREMENT PRIMARY KEY,
    Room_Number VARCHAR(10) UNIQUE NOT NULL,
    Room_Type VARCHAR(50) NOT NULL,
    Price_Per_Night DECIMAL(10, 2) NOT NULL,
    Availability_Status BOOLEAN DEFAULT TRUE
);*/

/* CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT NOT NULL,
    Room_ID INT NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    BookingStatus ENUM('Confirmed', 'Cancelled', 'Checked-Out', 'Checked-In'),
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)
);*/

/* CREATE TABLE Services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100),
    service_description TEXT,
    price DECIMAL(10, 2)
);*/

/* CREATE TABLE BookingServices ( 
    BookingServiceID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT NOT NULL,
    service_id INT NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
); 
*/

/* CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50), -- For example, 'Credit Card', 'Cash', 'Bank Transfer'
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);*/

/* CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    ContactInfo VARCHAR(150),
    Salary DECIMAL(10, 2),
    Room_ID INT,
    service_id INT,
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);*/

/* CREATE TABLE RoomAmenities (
    AmenityID INT PRIMARY KEY,
    AmenityName VARCHAR(255) NOT NULL,
    Room_ID INT,
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)
); */

  /*CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    Guest_ID INT,
    Comments TEXT,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID)
); */

/* CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(255) NOT NULL,
    BookingID INT,
    EventDate DATE NOT NULL,
    Room_ID INT,
    Guest_ID INT,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID),
    FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID)
);*/

/* Data Manipulation Statements (DML)*/ 

/* INSERT INTO Guests (name, phone, address, email) VALUES
('John Doe', '+1-800-555-1234', '123 Elm St, Springfield, IL, USA', 'john.doe@gmail.com'),
('Jane Smith', '+44 20 7946 0958', '456 Oak Rd, London, UK', 'jane.smith@yahoo.com'),
('Carlos Ramirez', '+52 55 5555 5555', '789 Maple Ave, Mexico City, MX', 'carlos.ramirez@hotmail.com'),
('Maria Gonzalez', '+34 91 123 4567', '321 Pine Blvd, Madrid, Spain', 'maria.gonzalez@gmail.com'),
('Liam O\'Connor', '+353 1 234 5678', '654 Cedar Ln, Dublin, Ireland', 'liam.oconnor@yahoo.com'),
('Aisha Ahmed', '+971 4 123 4567', '10 Dubai Mall, Dubai, UAE', 'aisha.ahmed@hotmail.com'),
('Tariq Khan', '+92 21 5555 5555', '22 Karachi St, Karachi, Pakistan', 'tariq.khan@gmail.com'),
('Hiroshi Tanaka', '+81 90 1234 5678', '123 Tokyo Rd, Tokyo, Japan', 'hiroshi.tanaka@yahoo.com'),
('Alice Johnson', '+1-312-555-9876', '789 Pine St, Chicago, IL, USA', 'alice.johnson@hotmail.com'),
('Marco Rossi', '+39 06 1234 5678', '456 Via Roma, Rome, Italy', 'marco.rossi@gmail.com'),
('Elena Ivanova', '+7 495 123 4567', '123 Red Square, Moscow, Russia', 'elena.ivanova@yahoo.com'),
('George Brown', '+1-202-555-7890', '987 Oak Blvd, Washington, D.C., USA', 'george.brown@hotmail.com'),
('Charlotte Turner', '+61 2 9876 5432', '321 Bondi Beach, Sydney, Australia', 'charlotte.turner@gmail.com'),
('Yuki Sato', '+81 80 1234 5678', '234 Shibuya, Tokyo, Japan', 'yuki.sato@yahoo.com'),
('Rajesh Kumar', '+91 11 2345 6719', '12 Connaught Place, New Delhi, India', 'rajesh.kumar@hotmail.com'),
('Isabella Martinez', '+54 11 1234 5678', '345 Buenos Aires Rd, Buenos Aires, Argentina', 'isabella.martinez@gmail.com'),
('Ahmed Abdullah', '+966 2 555 5555', '67 Jeddah St, Jeddah, Saudi Arabia', 'ahmed.abdullah@yahoo.com'),
('Olga Petrova', '+7 812 555 1234', '678 Nevsky Prospekt, St. Petersburg, Russia', 'olga.petrova@hotmail.com'),
('Sophia Williams', '+1-415-555-1234', '123 Sunset Blvd, San Francisco, CA, USA', 'sophia.williams@gmail.com'),
('Nia Ndegwa', '+254 20 123 4567', '101 Nairobi Rd, Nairobi, Kenya', 'nia.ndegwa@yahoo.com'),
('Michael Lee', '+1-213-555-7890', '456 Sunset Blvd, Los Angeles, CA, USA', 'michael.lee@hotmail.com'),
('Juan Carlos', '+34 93 234 5678', '789 La Rambla, Barcelona, Spain', 'juan.carlos@gmail.com'),
('Tina Wong', '+852 2 234 5678', '56 Kowloon Rd, Hong Kong', 'tina.wong@yahoo.com'),
('Kofi Appiah', '+233 30 276 2543', '19 Accra St, Accra, Ghana', 'kofi.appiah@hotmail.com'),
('Sarah Fitzgerald', '+44 161 123 4567', '43 Manchester Rd, Manchester, UK', 'sarah.fitzgerald@gmail.com'),
('Lucas Almeida', '+55 11 2345 6709', '89 Avenida Paulista, São Paulo, Brazil', 'lucas.almeida@yahoo.com'),
('Haruto Suzuki', '+81 70 1234 5678', '456 Osaka Rd, Osaka, Japan', 'haruto.suzuki@hotmail.com'),
('Nina Petrović', '+381 11 123 4567', '321 Belgrade St, Belgrade, Serbia', 'nina.petrovic@gmail.com'),
('Zara Ali', '+971 50 123 4567', '500 Palm Jumeirah, Dubai, UAE', 'zara.ali@yahoo.com'),
('Olivia Davis', '+1-512-555-1234', '234 Austin Blvd, Austin, TX, USA', 'olivia.davis@hotmail.com');*/

/* INSERT INTO Rooms (Room_Number, Room_Type, Price_Per_Night, Availability_Status)
VALUES
-- Standard Rooms
('101', 'Standard Room', 100.00, TRUE),
('102', 'Standard Room', 100.00, TRUE),
('103', 'Standard Room', 100.00, FALSE),
('104', 'Standard Room', 100.00, TRUE),
('105', 'Standard Room', 100.00, FALSE),
-- Deluxe Rooms
('201', 'Deluxe Room', 150.00, TRUE),
('202', 'Deluxe Room', 150.00, FALSE),
-- Luxury Rooms
('301', 'Luxury Room', 250.00, FALSE),
-- Suite Rooms
('401', 'Suite', 350.00, TRUE),
-- Executive Rooms
('501', 'Executive Room', 200.00, TRUE),
-- conference room
('CR001', 'Conference Room', 1200.00, TRUE); */

/*  INSERT INTO Bookings (guest_id, Room_ID, CheckInDate, CheckOutDate, TotalPrice, BookingStatus) VALUES
(30, 3, '2024-12-08', '2024-12-10', 200.00, 'Checked-In'),
(5, 5, '2024-12-09', '2024-12-13', 400.00, 'Checked-In'), 
(25, 7, '2024-12-10', '2024-12-12', 300.00, 'Checked-In'),
(15, 8, '2024-12-14', '2024-12-16', 500.00, 'Checked-In'),
(2, 3, '2024-07-05', '2024-07-10', 500.00, 'Checked-Out'),
(2, 8, '2024-06-25', '2024-06-30', 750.00, 'Checked-Out'),
(2, 4, '2024-11-15', '2024-11-20', 300.00, 'Confirmed'),
(6, 11, '2024-12-15', '2024-12-16', 1200.00, 'Confirmed'),
(6, 9, '2024-08-05', '2024-08-10', 1200.00, 'Checked-Out'),
(6, 10, '2024-07-20', '2024-07-22', 400.00, 'Checked-Out'),
(9, 2, '2024-05-05', '2024-05-10', 200.00, 'Cancelled'),
(9, 6, '2024-06-10', '2024-06-15', 450.00, 'Checked-Out'),
(9, 1, '2024-09-05', '2024-09-08', 300.00, 'Confirmed'),
(14, 5, '2024-08-10', '2024-08-12', 300.00, 'Checked-Out'),
(14, 8, '2024-06-18', '2024-06-20', 750.00, 'Checked-Out'),
(14, 10, '2024-12-01', '2024-12-03', 400.00, 'Confirmed'),
(21, 11, '2024-07-20', '2024-07-21', 1200.00, 'Checked-Out'),
(21, 7, '2024-06-15', '2024-06-18', 450.00, 'Checked-Out'),
(21, 3, '2024-11-01', '2024-11-05', 500.00, 'Confirmed'),
(1, 1, '2024-06-15', '2024-06-18', 300.00, 'Checked-Out'),
(3, 4, '2024-08-05', '2024-08-10', 300.00, 'Checked-Out'),
(4, 7, '2024-09-10', '2024-09-14', 600.00, 'Checked-Out'),
(5, 9, '2024-07-15', '2024-07-20', 1200.00, 'Checked-Out'),
(7, 5, '2024-06-10', '2024-06-12', 300.00, 'Cancelled'),
(8, 6, '2024-07-25', '2024-07-28', 450.00, 'Checked-Out'),
(10, 4, '2024-09-12', '2024-09-15', 300.00, 'Checked-Out'),
(11, 8, '2024-08-10', '2024-08-15', 750.00, 'Checked-Out'),
(12, 2, '2024-12-18', '2024-12-20', 200.00, 'Confirmed'),
(13, 6, '2024-05-12', '2024-05-15', 450.00, 'Checked-Out'),
(15, 7, '2024-07-14', '2024-07-16', 450.00, 'Checked-Out'),
(16, 9, '2024-08-05', '2024-08-10', 1200.00, 'Checked-Out'),
(17, 2, '2024-07-25', '2024-07-27', 200.00, 'Cancelled'),
(18, 8, '2024-07-20', '2024-07-25', 750.00, 'Checked-Out'),
(19, 10, '2024-06-15', '2024-06-17', 600.00, 'Checked-Out'),
(20, 5, '2024-07-20', '2024-07-25', 300.00, 'Checked-Out'),
(22, 4, '2024-10-10', '2024-10-12', 300.00, 'Cancelled'),
(23, 1, '2024-08-01', '2024-08-03', 300.00, 'Checked-Out'),
(24, 3, '2024-06-20', '2024-06-23', 500.00, 'Checked-Out'),
(25, 9, '2024-08-05', '2024-08-10', 1200.00, 'Checked-Out'),
(26, 5, '2024-09-12', '2024-09-15', 300.00, 'Cancelled'),
(27, 11, '2024-12-15', '2024-12-16', 1200.00, 'Confirmed'),
(28, 7, '2024-06-18', '2024-06-20', 450.00, 'Checked-Out'),
(29, 1, '2024-11-05', '2024-11-08', 300.00, 'Checked-Out'),
(30, 2, '2024-05-10', '2024-05-15', 200.00, 'Cancelled');*/

/* INSERT INTO Services (service_name, service_description, price) 
VALUES
('Room Cleaning', 'Daily cleaning service for guest rooms', 20.00),
('Laundry', 'Laundry and ironing service for guest clothes', 15.00),
('Spa', 'Relaxing spa treatment including massage', 50.00),
('Gym Access', 'Access to the hotel gym facilities', 10.00),
('Wi-Fi', 'High-speed internet access for one day', 5.00),
('Airport Shuttle', 'Transport service to and from the airport', 30.00),
('Breakfast Buffet', 'All-you-can-eat breakfast buffet', 15.00),
('Dinner Buffet', 'All-you-can-eat dinner buffet with drinks', 25.00),
('Room Service', 'Food and beverage delivery to the guest room', 10.00),
('Pool Access', 'Access to the hotel swimming pool', 10.00),*/

/* INSERT INTO BookingServices (BookingID, service_id)
VALUES 
    (5, 1), (5, 3), (5, 6), -- Services for BookingID 5
    (7, 2), (7, 4), -- Services for BookingID 7
    (8, 7), (8, 9), -- Services for BookingID 8
    (10, 1), (10, 2), (10, 8), -- Services for BookingID 10
    (11, 3), (11, 6), -- Services for BookingID 11
    (12, 5), (12, 7), -- Services for BookingID 12
    (13, 2), (13, 4), -- Services for BookingID 13
    (14, 1), (14, 4), -- Services for BookingID 14
    (16, 8), (16, 9), -- Services for BookingID 16
    (19, 1), (19, 3), -- Services for BookingID 19
    (23, 7), (23, 9), -- Services for BookingID 23
    (27, 8), (27, 9), -- Services for BookingID 27
    (29, 4), (29, 5); -- Services for BookingID 29 */

/* INSERT INTO Employees (EmployeeID, Name, Role, ContactInfo, Salary, Room_ID, service_id)
VALUES
(1, 'Alice Johnson', 'Housekeeper', 'alice.johnson@example.com', 2500.00, 1, 1), -- Room Cleaning for Standard Room 101
(2, 'Bob Smith', 'Housekeeper', 'bob.smith@example.com', 2600.00, 2, 1), -- Room Cleaning for Standard Room 102
(3, 'Charlie Davis', 'Housekeeper', 'charlie.davis@example.com', 2700.00, 3, 1), -- Room Cleaning for Standard Room 103
(4, 'Diana Clark', 'Laundry Staff', 'diana.clark@example.com', 2200.00, 4, 2), -- Laundry for Standard Room 104
(5, 'Eva White', 'Laundry Staff', 'eva.white@example.com', 2300.00, 5, 2), -- Laundry for Standard Room 105
(6, 'Frank Green', 'Spa Therapist', 'frank.green@example.com', 3500.00, 6, 3), -- Spa for Deluxe Room 201
(7, 'Grace Blue', 'Spa Therapist', 'grace.blue@example.com', 3600.00, 7, 3), -- Spa for Deluxe Room 202
(8, 'Harry Lewis', 'Gym Instructor', 'harry.lewis@example.com', 3000.00, 8, 4), -- Gym Access for Luxury Room 301
(9, 'Ivy White', 'Gym Instructor', 'ivy.white@example.com', 3100.00, 9, 4), -- Gym Access for Suite Room 401
(10, 'Jack Taylor', 'Wi-Fi Support', 'jack.taylor@example.com', 1800.00, 10, 5), -- Wi-Fi for Executive Room 501
(11, 'Karen Brown', 'Wi-Fi Support', 'karen.brown@example.com', 1900.00, 11, 5), -- Wi-Fi for Conference Room CR001
(12, 'Liam Johnson', 'Shuttle Driver', 'liam.johnson@example.com', 2200.00, 1, 6), -- Airport Shuttle for Standard Room 101
(13, 'Mona Adams', 'Shuttle Driver', 'mona.adams@example.com', 2300.00, 2, 6), -- Airport Shuttle for Standard Room 102
(14, 'Nina Clark', 'Shuttle Driver', 'nina.clark@example.com', 2400.00, 3, 6), -- Airport Shuttle for Standard Room 103
(15, 'Oscar King', 'Restaurant Staff', 'oscar.king@example.com', 2500.00, 4, 7), -- Breakfast Buffet for Standard Room 104
(16, 'Paul Hall', 'Restaurant Staff', 'paul.hall@example.com', 2600.00, 5, 7), -- Breakfast Buffet for Standard Room 105
(17, 'Quincy Lee', 'Restaurant Staff', 'quincy.lee@example.com', 2700.00, 6, 8), -- Dinner Buffet for Deluxe Room 201
(18, 'Rita Harris', 'Room Service Staff', 'rita.harris@example.com', 2800.00, 7, 9), -- Room Service for Deluxe Room 202
(19, 'Sam Nelson', 'Room Service Staff', 'sam.nelson@example.com', 2900.00, 8, 9), -- Room Service for Luxury Room 301
(20, 'Tina Clark', 'Pool Attendant', 'tina.clark@example.com', 2000.00, 9, 10), -- Pool Access for Suite Room 401
(21, 'Ursula Green', 'Pool Attendant', 'ursula.green@example.com', 2100.00, 10, 10), -- Pool Access for Executive Room 501
(22, 'John Smith', 'Manager', '123-456-7890', 5000.00, NULL, NULL),  -- Manager with no specific service or room
(23, 'Alice Johnson', 'Receptionist', '234-567-8901', 2000.00, NULL, NULL),  -- Receptionist 1
(24, 'Bob Brown', 'Receptionist', '345-678-9012', 2000.00, NULL, NULL);  -- Receptionist 2 */

/* INSERT INTO Payments (BookingID, PaymentDate, Amount, PaymentMethod)
VALUES
(5, '2024-12-08', 300.00, 'Credit Card'),
(10, '2024-12-08', 810.00, 'Cash'),
(14, '2024-12-08', 430.00, 'Debit Card'),
(19, '2024-12-08', 820.00, 'Credit Card'),
(7, '2024-12-08', 325.00, 'Cash'),
(13, '2024-12-08', 1225.00, 'Bank Transfer'),
(11, '2024-12-08', 380.00, 'Debit Card'),
(29, '2024-12-08', 465.00, 'Credit Card'),
(12, '2024-12-08', 1220.00, 'Cash'),
(8, '2024-12-08', 525.00, 'Credit Card'),
(23, '2024-12-08', 525.00, 'Debit Card'),
(16, '2024-12-08', 485.00, 'Bank Transfer'),
(27, '2024-12-08', 1235.00, 'Credit Card'),
(6, '2024-12-09', 400.00, 'Credit Card'),
(9, '2024-07-05', 500.00, 'Cash'),
(15, '2024-05-05', 200.00, 'Debit Card'),
(17, '2024-09-05', 300.00, 'Credit Card'),
(18, '2024-08-10', 300.00, 'Cash'),
(20, '2024-12-01', 400.00, 'Debit Card'),
(21, '2024-07-20', 1200.00, 'Credit Card'),
(22, '2024-06-15', 450.00, 'Cash'),
(24, '2024-06-15', 300.00, 'Debit Card'),
(25, '2024-08-05', 300.00, 'Credit Card'),
(26, '2024-09-10', 600.00, 'Cash'),
(28, '2024-06-10', 300.00, 'Debit Card'),
(30, '2024-09-12', 300.00, 'Credit Card'),
(31, '2024-08-10', 750.00, 'Cash'),
(32, '2024-12-18', 200.00, 'Debit Card'),
(33, '2024-05-12', 450.00, 'Credit Card'),
(34, '2024-07-14', 450.00, 'Cash'),
(35, '2024-08-05', 1200.00, 'Debit Card'),
(36, '2024-07-25', 200.00, 'Credit Card'),
(37, '2024-07-20', 750.00, 'Cash'),
(38, '2024-06-15', 600.00, 'Debit Card'),
(39, '2024-07-20', 300.00, 'Credit Card'),
(40, '2024-10-10', 300.00, 'Cash'),
(41, '2024-08-01', 300.00, 'Debit Card'),
(42, '2024-06-20', 500.00, 'Credit Card'),
(43, '2024-08-05', 1200.00, 'Cash'),
(44, '2024-09-12', 300.00, 'Debit Card'),
(45, '2024-12-15', 1200.00, 'Credit Card'),
(46, '2024-06-18', 450.00, 'Cash'),
(47, '2024-11-05', 300.00, 'Debit Card'),
(48, '2024-05-10', 200.00, 'Credit Card');*/

/*INSERT INTO RoomAmenities (AmenityID, AmenityName, Room_ID) VALUES
(1, 'WiFi',  1),
(2, 'Television',  1),
(3, 'Air Conditioning',  1),
(4, 'WiFi',  2),
(5, 'Television',  2),
(6, 'Air Conditioning',  2),
(7, 'WiFi',  3),
(8, 'Television',  3),
(9, 'Air Conditioning',  3),
(10, 'WiFi',  4),
(11, 'Television',  4),
(12, 'Air Conditioning',  4),
(13, 'WiFi',  5),
(14, 'Television',  5),
(15, 'Air Conditioning',  5),
(16, 'WiFi',  6),
(17, 'Television',  6),
(18, 'Air Conditioning',  6),
(19, 'Mini-Fridge',  6),
(20, 'WiFi',  7),
(21, 'Television',  7),
(22, 'Air Conditioning',  7),
(23, 'Mini-Fridge',  7),
(24, 'WiFi',  8),
(25, 'Television',  8),
(26, 'Air Conditioning',  8),
(27, 'Mini-Fridge',  8),
(28, 'Bathrobe & Slippers',  8),
(29, 'WiFi',  9),
(30, 'Television',  9),
(31, 'Air Conditioning',  9),
(32, 'Mini-Fridge',  9),
(33, 'Bathrobe & Slippers',  9),
(34, 'Kitchenette',  9),
(35, 'WiFi',  10),
(36, 'Television',  10),
(37, 'Air Conditioning',  10),
(38, 'Work Desk',  10),
(39, 'Projector', 11),
(40, 'WiFi', 11),
(41, 'Whiteboard', 11),
(42, 'Conference Phone', 11); */

/* INSERT INTO Feedback (FeedbackID, Guest_ID, Comments, Rating) VALUES
(1, 15, 'Excellent service and friendly staff!', 5),
(2, 7, 'Room was clean, but the AC was a bit noisy.', 4),
(3, 23, 'Loved the ambiance and the food.', 5),
(4, 10, 'The WiFi connection was slow.', 3),
(5, 3, 'Very comfortable stay, will come again.', 5),
(6, 28, 'The staff was helpful, but the location was noisy.', 4),
(7, 19, 'Breakfast options were limited.', 3),
(8, 12, 'Beautiful rooms and great amenities.', 5),
(9, 4, 'The check-in process took too long.', 3),
(10, 26, 'Overall a decent experience.', 4),
(11, 18, 'The spa services were amazing!', 5),
(12, 8, 'The room was smaller than expected.', 3),
(13, 30, 'Excellent value for money.', 5),
(14, 11, 'The bed was very comfortable.', 4),
(15, 21, 'The staff was rude and unhelpful.', 3),
(16, 2, 'Loved the location and the view.', 5),
(17, 25, 'Parking was a hassle.', 2),
(18, 14, 'The pool area was clean and well-maintained.', 4),
(19, 6, 'The food was delicious!', 5),
(20, 9, 'Had some issues with room service.', 3);*/

/* INSERT INTO Events (EventID, EventName, BookingID, EventDate, Room_ID, guest_id)
VALUES 
(1, 'Get Together', 8, '2024-12-15', 11, 6),
(2, 'BirthDay', 17, '2024-07-20', 11, 21),
(3, 'BabyShower', 41, '2024-12-16', 11, 27);
*/

/* DELETE FROM bookings
WHERE bookingid < 5; */

/* UPDATE bookings
set bookingstatus = 'Cancelled'
WHERE bookingid = 15;*/













