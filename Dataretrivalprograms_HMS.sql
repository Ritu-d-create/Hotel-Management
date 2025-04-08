/* Data Retrieval Statements (DQL) */

/* for retrieving all data from tables */
/* select * from bookings;
select * from bookingservices;
select * from employees;
select * from feedback;
select * from events;
select * from guests;
select * from payments;
select * from roomamenities;
select * from rooms;
select * from services;
*/

/* SQL Query Using Joins to Retrieve Guest, Room, and Booking Information with Booking Status and Dates"*/

/* SELECT 
    g.name AS GuestName, 
    r.room_number AS RoomNumber, 
    b.checkindate, 
    b.checkoutdate,
    b.bookingstatus AS BookingStatus
FROM 
    bookings b
JOIN guests g ON b.guest_id = g.guest_id
JOIN rooms r ON b.room_id = r.room_id;*/


/*SQL Query Using Joins to Retrieve Guest, Room, Service, and Booking Information*/
/*SELECT 
    g.name AS GuestName, 
    r.room_number AS RoomNumber, 
    s.service_name 
FROM 
    bookingservices bs
JOIN bookings b ON bs.BookingServiceID = b.bookingid
JOIN guests g ON b.guest_id = g.guest_id
JOIN services s ON bs.service_id = s.service_id
JOIN rooms r ON b.room_id = r.room_id;*/

/* SQL Query Using Aggregate and Date Functions to Calculate Monthly Revenue with Filtering and Sorting */

/* SELECT 
    MONTH(paymentDate) AS Month, 
    SUM(amount) AS TotalRevenue 
FROM 
    payments 
WHERE 
    paymentDate BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
    MONTH(paymentDate)
ORDER BY 
MONTH(paymentDate);*/

/* SQL Query Using Joins and Aggregate Functions to Calculate Average Stay Duration for Each Room */

/*SELECT 
    r.room_number AS RoomNumber, 
    AVG(DATEDIFF(b.checkoutdate, b.checkindate)) AS AvgStayDuration 
FROM 
    bookings b
JOIN rooms r ON b.room_id = r.room_id
GROUP BY 
    r.room_number;*/
  
  /* SQL Query Using Joins and Grouping to Identify Guests with More Than One Booking */
  /*SELECT 
    g.name AS GuestName, 
    COUNT(b.bookingid) AS TotalBookings 
FROM 
    bookings b
JOIN guests g ON b.guest_id = g.guest_id
GROUP BY 
    g.name
HAVING 
    COUNT(b.bookingid) > 1;*/
    
/* SQL Query Using Joins and Grouping to Determine the Most Popular Services Based on Usage */

/* SELECT 
    s.service_name, 
    COUNT(bs.service_id) AS UsageCount 
FROM 
    bookingservices bs
JOIN services s ON bs.service_id = s.service_id
GROUP BY 
    s.service_name; */
    
   /* SQL Query Using Joins and Grouping to Analyze Guest Preferences Based on Bookings, Services Used, and Feedback Ratings for Predictive Modeling */
   
/* eventsSELECT 
    g.guest_id, 
    g.name AS GuestName, 
    COUNT(b.bookingid) AS TotalBookings, 
    GROUP_CONCAT(DISTINCT s.service_name) AS ServicesUsed, 
    AVG(f.rating) AS AverageFeedbackRating 
FROM 
    guests g
LEFT JOIN bookings b ON g.guest_id = b.guest_id
LEFT JOIN bookingservices bs ON b.bookingid = bs.bookingid
LEFT JOIN services s ON bs.service_id = s.service_id
LEFT JOIN feedback f ON g.guest_id = f.guest_id
WHERE 
    f.rating IS NOT NULL  -- This ensures only guests who gave feedback are included
GROUP BY 
    g.guest_id, g.name;
*/  

/* SQL Query Using Joins and Grouping to Calculate Monthly Revenue for Each Room Type and Room Number */
/* SELECT 
    MONTH(b.checkindate) AS Month, 
    YEAR(b.checkindate) AS Year, 
    r.room_type AS RoomType,
    r.Room_Number as room_number,
    SUM(p.amount) AS MonthlyRevenue 
FROM 
    bookings b
JOIN payments p ON b.bookingid = p.bookingid
JOIN rooms r ON b.room_id = r.room_id
GROUP BY 
    YEAR(b.checkindate), 
    MONTH(b.checkindate), 
    r.room_type,
    r.Room_Number
ORDER BY 
    Year, Month;*/
    
    /*  SQL Query Using Temporary Table and Joins to Analyze Room Demand by Total Bookings for Each Room Type */
  /*  CREATE TEMPORARY TABLE TempRoomBookings AS
SELECT 
    Month(b.checkoutdate) as month,
    Year(b.checkoutdate) as year,
    r.Room_Type,
    b.Room_id,
    COUNT(b.Room_Id) AS TotalBookings
FROM 
    bookings b
JOIN 
    rooms r ON b.room_id = r.room_id   -- Assuming room_id in both tables
GROUP BY 
    Month, Year, r.Room_Type, b.Room_id;
   /* SELECT 
    Room_Type, 
    SUM(TotalBookings) AS TotalBookings
FROM 
    TempRoomBookings
GROUP BY 
    Room_Type
ORDER BY 
    TotalBookings DESC;
    */

/* SQL Query Using Joins, Window Functions, and Grouping to Rank Room Types by Total Bookings and Calculate Percentage of Bookings */
     /* SELECT 
    Room_Type, 
    COUNT(*) AS TotalBookings, 
    ROUND((COUNT(*) * 100.0) / SUM(COUNT(*)) OVER (), 2) AS PercentageOfBookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS RankByBookings
FROM 
    bookings 
JOIN 
    rooms USING (room_id) -- Using clause for simplifying the join
GROUP BY 
    Room_Type
ORDER BY 
    PercentageOfBookings DESC;*/

/* SQL Query Using CTEs, Window Functions, and Aggregation to Rank Guests by Total Spending and Analyze Their Contribution to Hotel Revenue */
/* WITH GuestRevenue AS (
    -- Subquery to calculate the total spending by each guest on services
    SELECT 
        g.guest_id, 
        g.name AS GuestName, 
        SUM(p.amount) AS TotalSpent
    FROM 
        guests g
    JOIN bookings b ON g.guest_id = b.guest_id
    JOIN payments p ON b.bookingid = p.bookingid
    JOIN bookingservices bs ON b.bookingid = bs.bookingid
    GROUP BY 
        g.guest_id, g.name
),
TotalRevenue AS (
    -- Subquery to calculate total revenue for the hotel
    SELECT 
        SUM(amount) AS TotalHotelRevenue
    FROM 
        payments
),
GuestBookings AS (
    -- Subquery to calculate the average booking duration for each guest
    SELECT 
        g.guest_id,
        AVG(DATEDIFF(b.checkoutdate, b.checkindate)) AS AvgStayDuration
    FROM 
        guests g
    JOIN bookings b ON g.guest_id = b.guest_id
    GROUP BY 
        g.guest_id
),
RankedGuests AS (
    -- CTE to calculate the rank of guests based on their total spending
    SELECT 
        gr.GuestName,
        gr.TotalSpent,
        gavg.AvgStayDuration,
        ROUND((gr.TotalSpent / tr.TotalHotelRevenue) * 100, 2) AS SpendingPercentage,
        RANK() OVER (ORDER BY gr.TotalSpent DESC) AS RankBySpending
    FROM 
        GuestRevenue gr
    JOIN 
        GuestBookings gavg ON gr.guest_id = gavg.guest_id
    JOIN 
        TotalRevenue tr
)
-- Main query to select the top 3 guests by rank
SELECT 
    GuestName,
    TotalSpent,
    AvgStayDuration,
    SpendingPercentage,
    RankBySpending
FROM 
    RankedGuests
WHERE 
    RankBySpending <= 3
ORDER BY 
    RankBySpending;*/

/* SQL Query Using CTEs, Joins, and Window Functions to Rank Rooms by Total Revenue and Calculate Occupancy Rate Starting from the 5th Month */
/* WITH RoomRevenue AS (
    -- Subquery to calculate the total revenue generated by each room
    SELECT 
        r.room_id, 
        r.room_type, 
        r.room_number,
        SUM(p.amount) AS TotalRevenue
    FROM 
        rooms r
    JOIN bookings b ON r.room_id = b.room_id
    JOIN payments p ON b.bookingid = p.bookingid
    GROUP BY 
        r.room_id, r.room_type, r.room_number
),
RoomOccupancy AS (
    -- Subquery to calculate the total days booked for each room, starting from the 5th month (May)
    SELECT 
        r.room_id,
        COUNT(b.bookingid) AS TotalBookings,
        SUM(DATEDIFF(b.checkoutdate, b.checkindate)) AS TotalDaysBooked,
        -- Assuming the period starts from the 5th month (May), adjust for custom periods as needed
        -- Calculate the available days starting from the 5th month
        DATEDIFF(CONCAT(YEAR(CURDATE()), '-12-31'), CONCAT(YEAR(CURDATE()), '-05-01')) + 1 AS TotalAvailableDays
    FROM 
        rooms r
    JOIN bookings b ON r.room_id = b.room_id
    WHERE 
        b.checkindate >= CONCAT(YEAR(CURDATE()), '-05-01')  -- Filter for bookings starting from May
    GROUP BY 
        r.room_id
),
RankedRooms AS (
    -- CTE to rank rooms by total revenue
    SELECT 
        rr.room_id, 
        rr.room_type, 
        rr.room_number,
        rr.TotalRevenue,
        ro.TotalBookings,
        ro.TotalDaysBooked,
        ro.TotalAvailableDays,
        ROUND((ro.TotalDaysBooked / ro.TotalAvailableDays) * 100, 2) AS OccupancyRate,
        RANK() OVER (ORDER BY rr.TotalRevenue DESC) AS RankByRevenue
    FROM 
        RoomRevenue rr
    JOIN 
        RoomOccupancy ro ON rr.room_id = ro.room_id
)
-- Final query to select the top 5 most profitable rooms starting from the 5th month
SELECT 
    room_type,
    room_number,
    TotalRevenue,
    TotalBookings,
    TotalDaysBooked,
    TotalAvailableDays,
    OccupancyRate,
    RankByRevenue
FROM 
    RankedRooms
WHERE 
    RankByRevenue <= 5
ORDER BY 
    RankByRevenue;
*/ 

/* SQL Query Using CTEs and Aggregation to Calculate Hotel-Wide Occupancy Rate Starting from the 5th Month */
/* WITH RoomOccupancy AS (
    -- Subquery to calculate the total days booked for the entire hotel
    SELECT 
        r.room_id,
        COUNT(b.bookingid) AS TotalBookings,
        SUM(DATEDIFF(b.checkoutdate, b.checkindate)) AS TotalDaysBooked,
        -- Assuming the period starts from the 5th month (May), adjust for custom periods as needed
        -- Calculate the available days starting from the 5th month
        DATEDIFF(CONCAT(YEAR(CURDATE()), '-12-31'), CONCAT(YEAR(CURDATE()), '-05-01')) + 1 AS TotalAvailableDays
    FROM 
        rooms r
    JOIN bookings b ON r.room_id = b.room_id
    WHERE 
        b.checkindate >= CONCAT(YEAR(CURDATE()), '-05-01')  -- Filter for bookings starting from May
    GROUP BY 
        r.room_id
),
HotelOccupancy AS (
    -- CTE to calculate the total booked and available days for the entire hotel
    SELECT 
        SUM(TotalDaysBooked) AS TotalBookedDays,
        SUM(TotalAvailableDays) AS TotalHotelAvailableDays
    FROM 
        RoomOccupancy
)
-- Final query to calculate the hotel-wide occupancy rate
SELECT 
    ROUND((TotalBookedDays / TotalHotelAvailableDays) * 100, 2) AS HotelOccupancyRate
FROM 
    HotelOccupancy;
*/