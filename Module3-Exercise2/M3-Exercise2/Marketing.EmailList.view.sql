IF OBJECT_ID('Marketing.EmailList') IS NOT NULL DROP FUNCTION Marketing.EmailList;
GO
CREATE VIEW Marketing.EmailList
AS

  SELECT CustomerId, FirstName, LastName, Email, OptIn
  from Booking.Customers
  where optin = 1;
  
GO