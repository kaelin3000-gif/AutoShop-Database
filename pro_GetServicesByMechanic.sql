CREATE PROCEDURE GetServicesByMechanic
    @mechanic_id VARCHAR(30)
AS
BEGIN
    SELECT 
        S.service_ID,
        S.registration,
        S.dropoff_date,
        S.next_service,
        S.work_required
    FROM SERVICE S
    JOIN EMPLOYEE_SERVICE ES ON S.service_ID = ES.service_ID
    WHERE ES.employee_ID = @mechanic_id
    ORDER BY S.dropoff_date;
END;
