-- SQL OLA Data Analysis - P1


-- Data Analysis & Business Key Problems & Answers

-- 1. Retrieve all successful bookings:
-- 2. Find the average ride distance for each vehicle type:
-- 3. Get the total number of cancelled rides by customers:
-- 4. List the top 5 customers who booked the highest number of rides:
-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
-- 7. Retrieve all rides where payment was made using UPI:
-- 8. Find the average customer rating per vehicle type:
-- 9. Calculate the total booking value of rides completed successfully:
-- 10. List all incomplete rides along with the reason:

 Create Database Ola;
 Use Ola;


 -- Q.1 Retrieve all successful bookings:

Create View Successful_Bookings As
SELECT * FROM bookings
WHERE Booking_Status = 'Success';


-- Q.2 Find the average ride distance for each vehicle type:

 Create View ride_distance_for_each_vehicle As
 SELECT Vehicle_Type, AVG(Ride_Distance)
 as avg_distance FROM bookings
 GROUP BY Vehicle_Type;


-- Q.3 Get the total number of cancelled rides by customers:

 Create View cancelled_rides_by_customers As
 SELECT COUNT(*) FROM bookings
 WHERE Booking_Status = 'cancelled by Customer';



-- Q.4  List the top 5 customers who booked the highest number of rides:

 Create View Top_5_Customers As
 SELECT Customer_ID, COUNT(Booking_ID) as total_rides
 FROM bookings
 GROUP BY Customer_ID
 ORDER BY total_rides DESC LIMIT 5;




-- Q.5 Get the number of rides cancelled by drivers due to personal and car-related issues:

Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings
WHERE cancelled_Rides_by_Driver = 'Personal & Car related issue';




-- Q.6 Find the maximum and minimum driver ratings for Prime Sedan bookings:

Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';



-- Q.7  Retrieve all rides where payment was made using UPI:

Create View UPI_Payment As
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';




-- Q.8 Find the average customer rating per vehicle type:

Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;



-- Q.9  Calculate the total booking value of rides completed successfully:

Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';



-- Q.10 List all incomplete rides along with the reason:

Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';


-- End of project

