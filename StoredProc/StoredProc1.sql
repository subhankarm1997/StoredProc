CREATE OR ALTER PROCEDURE dbo.GetEmployeeSalary
    @EmployeeID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Salary DECIMAL(10, 2);

    -- Retrieve the salary for the specified employee
    SELECT @Salary = Salary
    FROM Employees
    WHERE EmployeeID = @EmployeeID;

    -- Return the result
    SELECT EmployeeID, Name, @Salary AS Salary
    FROM Employees
    WHERE EmployeeID = @EmployeeID;
END;
