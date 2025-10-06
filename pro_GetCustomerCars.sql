CREATE PROCEDURE GetCustomerCars
    @customer_id VARCHAR(30)
AS
BEGIN
    SELECT 
        CAR.registration,
        CAR.make,
        CAR.model,
        CAR.date_of_manufacture
    FROM CAR
    WHERE CAR.customer_ID = @customer_id;
END;