CREATE PROCEDURE AssignMechanicToService
    @mechanic_id VARCHAR(30),
    @service_id VARCHAR(30)
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM EMPLOYEE_UNAVAILABILITY
        WHERE employee_ID = @mechanic_id
        AND EXISTS (
            SELECT 1
            FROM SERVICE
            WHERE service_ID = @service_id
            AND dropoff_date BETWEEN start_date AND end_date
        )
    )
    BEGIN
        RAISERROR ('Mechanic is unavailable during this period.', 16, 1);
        RETURN;
    END
    
    INSERT INTO EMPLOYEE_SERVICE (employee_ID, service_ID, time_spent)
    VALUES (@mechanic_id, @service_id, '00:00:00');
    
    PRINT 'Mechanic assigned successfully.';
END;

