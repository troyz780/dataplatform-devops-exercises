EXEC tSQLt.NewTestClass 'Marketing_GetGreeting_Tests';
GO

CREATE PROCEDURE Marketing_GetGreeting_Tests.[test something]
AS
BEGIN
	DECLARE @message varchar(500);
  --set @message = 'sdfsfsd'
  --SET @message = (SELECT * FROM Marketing.GetGreeting);
  SELECT @message = Marketing.GetGreeting();

  EXEC tSQLt.AssertEquals @Expected = 'hello23423423424234', @Actual = @message;
  
END
GO