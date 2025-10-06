--Prevent assigning a mechanic to a service during their unavailability.


CREATE TRIGGER trg_PreventServiceOverlap
ON EMPLOYEE_SERVICE
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM EMPLOYEE_SERVICE ES
        JOIN EMPLOYEE_UNAVAILABILITY EU ON ES.employee_ID = EU.employee_ID
        JOIN SERVICE S ON ES.service_ID = S.service_ID
        WHERE S.dropoff_date BETWEEN EU.start_date AND EU.end_date
    )
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR ('Mechanic is unavailable during this period.', 16, 1);
    END
END;
