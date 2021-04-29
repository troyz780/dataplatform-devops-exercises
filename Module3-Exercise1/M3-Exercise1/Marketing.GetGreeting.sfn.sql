use [DEMODB]
IF  EXISTS (SELECT [name] FROM sys.objects 
            WHERE object_id = OBJECT_ID('Marketing.GetGreeting'))
BEGIN
   DROP FUNCTION Marketing.GetGreeting;
END

--DROP FUNCTION IF EXISTS Marketing.GetGreeting;
GO
CREATE FUNCTION Marketing.GetGreeting()
RETURNS NVARCHAR(MAX)
AS
BEGIN
  --select 'Hello ' message_text
 
  return 'hello23423423424234'
END;
GO