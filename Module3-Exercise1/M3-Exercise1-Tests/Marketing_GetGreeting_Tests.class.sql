EXEC tSQLt.NewTestClass 'Marketing_GetGreeting_Tests';
GO

CREATE PROCEDURE Marketing_GetGreeting_Tests.[test returns correct greeting for john smith]
AS
BEGIN

--assemble 
	DECLARE @message varchar(500);
	declare @fname varchar(100) = 'John';
	declare @lname varchar(100) = 'Smith';

--ACTION
	SELECT @message = Marketing.GetGreeting(@fname, @lname);

--Assertion	 

  EXEC tSQLt.AssertEquals @Expected = 'Dear J. Smith', @Actual = @message;
  
END
GO

CREATE PROCEDURE Marketing_GetGreeting_Tests.[test returns correct greeting for troy phan]
AS
BEGIN

--assemble 
	DECLARE @message varchar(500);
	declare @fname varchar(100) = 'Troy';
	declare @lname varchar(100) = 'Phan';

--ACTION
	SELECT @message = Marketing.GetGreeting(@fname, @lname);

--Assertion	 

  EXEC tSQLt.AssertEquals @Expected = 'Dear T. Phan', @Actual = @message;
  
END
GO

CREATE PROCEDURE Marketing_GetGreeting_Tests.[test returns Dear Customer if the First Name is null]
AS
BEGIN

--assemble 
	DECLARE @message varchar(500);
	declare @fname varchar(100) = null;
	declare @lname varchar(100) = 'Phan';

--ACTION
	SELECT @message = Marketing.GetGreeting(@fname, @lname);

--Assertion	 

  EXEC tSQLt.AssertEquals @Expected = 'Dear Customer', @Actual = @message;
  
END
GO