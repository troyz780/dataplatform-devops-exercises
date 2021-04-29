EXEC tSQLt.NewTestClass 'Marketing_EmailList_Tests';
GO

EXEC tSQLt.NewTestClass 'Marketing_EmailList_Tests_2';
GO

CREATE PROCEDURE Marketing_EmailList_Tests.[test something]
AS
BEGIN
  INSERT INTO Booking.Customers
  VALUES(1, 'Troy', 'Phan', CONVERT(date, '01-jan-2021'), null,null,null,'troy.phan@aimco.ca',1,null);
  
  SELECT CustomerId, FirstName, LastName, Email, OptIn INTO #Actual FROM Marketing.EmailList;
  
  SELECT  A.* INTO #Expected FROM #Actual A RIGHT JOIN #Actual X ON 1=0;
  
  INSERT INTO #Expected
  VALUES(null, 'Troy', 'Phan', 'troy.phan@aimco.ca',1);

  EXEC tSQLt.AssertEqualsTable '#Expected','#Actual';
END
GO


CREATE PROCEDURE Marketing_EmailList_Tests_2.[test something]
AS
BEGIN
  INSERT INTO Booking.Customers
  VALUES(1, 'Troy', 'Phan', CONVERT(date, '01-jan-2021'), null,null,null,'troy.phan@aimco.ca',0,null);
  
  SELECT CustomerId, FirstName, LastName, Email, OptIn INTO #Actual FROM Marketing.EmailList;
  
  SELECT top (0) A.* INTO #Expected FROM #Actual A RIGHT JOIN #Actual X ON 1=0;
  
  INSERT INTO #Expected
  VALUES(1, 'Troy', 'Phan', 'troy.phan@aimco.ca',1);

  EXEC tSQLt.AssertEqualsTable '#Expected','#Actual';
END
GO