use [DEMODB]
IF  EXISTS (SELECT [name] FROM sys.objects 
            WHERE object_id = OBJECT_ID('Marketing.GetGreeting'))
BEGIN
   DROP FUNCTION Marketing.GetGreeting;
END

--DROP FUNCTION IF EXISTS Marketing.GetGreeting;
GO
CREATE FUNCTION Marketing.GetGreeting(@FirstName Varchar(100), @LastName Varchar(100))
RETURNS NVARCHAR(MAX)
AS
BEGIN
  declare @message varchar(500);

  if (@FirstName is null)
  begin
     set @message = 'Dear Customer'
  end
  else
	set @message = 'Dear ' + left(@FirstName, 1) + '. ' + @LastName

 return @message
END;
GO