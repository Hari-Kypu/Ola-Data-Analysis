
-- 1. All successful bookings

CREATE VIEW Successful_Bookings AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        booking_status = 'success';


-- 2. Average ride distance for each vehicle type

SELECT 
    vehicle_type, AVG(ride_distance) AS avg_distance
FROM
    bookings
GROUP BY vehicle_type;


-- 3. Total number of cancelled rides by customers

SELECT 
    COUNT(*)
FROM
    bookings
WHERE
    Booking_Status = 'canceled by Customer';


 -- 4. Top 5 customers who booked the highest number of rides
 
 SELECT 
    Customer_ID, COUNT(Booking_ID) AS total_rides
FROM
    bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;


-- 5. Number of rides cancelled by drivers due to personal and car-related issues

SELECT 
    COUNT(*)
FROM
    bookings
WHERE
    canceled_Rides_by_Driver = 'Personal & Car related issue';


-- 6. Maximum and minimum driver ratings for Prime Sedan bookings

SELECT 
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM
    bookings
WHERE
    Vehicle_Type = 'Prime Sedan';
    
-- 7. All rides where payment was made using UPI
SELECT 
    *
FROM
    bookings
WHERE
    Payment_Method = 'UPI';
    
 -- 8. Average customer rating per vehicle type
 
SELECT 
    Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM
    bookings
GROUP BY Vehicle_Type;

 -- 9. Total booking value of rides completed successfully
SELECT 
    SUM(Booking_Value) AS total_successful_value
FROM
    bookings
WHERE
    Booking_Status = 'Success';
    
    
 -- 10. All incomplete rides along with the reason
 
SELECT 
    Booking_ID, Incomplete_Rides_Reason
FROM
    bookings
WHERE
    Incomplete_Rides = 'Yes';
 