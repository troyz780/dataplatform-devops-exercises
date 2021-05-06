EXEC tSQLt.NewTestClass 'Reports_TopCustomers_Tests';
GO
/*
-- Note: This is neither the first nor the only test you would need to write for this particular method.
*/
--GO
--CREATE PROCEDURE Reports_TopCustomers_Tests.[test returns the top 2 out of 3 customers based on their reservation count]
--AS
--BEGIN
--  declare @expected_customer int; set @expected_customer = 6;
--  declare @actual int;
--  exec tSQLt.FakeTable 'Booking.Reservations';               
  
--  INSERT INTO Booking.Customers
--  VALUES(1001, 'Troy', 'Phan', CONVERT(date, '01-jan-2021'), null,null,null,'troy.phan@aimco.ca',1,null),
--  (2002, 'fname_one', 'one', CONVERT(date, '01-jan-2021'), null,null,null,'troy.phan@aimco.ca',1,null),
--  (3003, 'fname_two', 'two', CONVERT(date, '01-jan-2021'), null,null,null,'troy.phan@aimco.ca',1,null);

--  INSERT INTO Booking.Reservations(CustomerId)
--  VALUES(1001),(1001),(1001),(2002),(3003),(3003);
  
--  SELECT CustomerId, ReservationCount INTO fake_reservation FROM Reports.TopNCustomers(2);
    
--  SELECT TOP(0) A.* INTO #Expected FROM #Actual A RIGHT JOIN #Actual X ON 1=0;
  
--  INSERT INTO #Expected
--  VALUES(1001,3),(3003,2);

--  EXEC tSQLt.AssertEqualsTable #Expected,#Actual;
--  --EXEC tSQLt.AssertEquals @Expected_customer, @actual;

--END;
--GO




CREATE PROCEDURE Reports_TopCustomers_Tests.[test returns the top 2 out of 3 customers based on their reservation count]
AS
BEGIN
  exec tSQLt.FakeTable 'Booking.Reservations';               
  INSERT INTO Booking.Reservations(CustomerId)
  VALUES(1001),(1001),(1001),(2002),(3003),(3003);
  
  SELECT CustomerId, ReservationCount INTO #Actual FROM Reports.TopNCustomers(2);
  
  SELECT TOP(0) A.* INTO #Expected FROM #Actual A RIGHT JOIN #Actual X ON 1=0;
  
  INSERT INTO #Expected
  VALUES(1001,3),(3003,2);

  EXEC tSQLt.AssertEqualsTable '#Expected','#Actual';

END;
GO
