use DEMODB
go
EXEC tSQLt.NewTestClass 'LostAndFound_CalculateShipping_Tests';
GO

 

CREATE PROCEDURE LostAndFound_CalculateShipping_Tests.[test something]
AS
BEGIN
  create table #expected (shipping_cost real);
  insert into #expected values(25.0);

 

  select shipping_cost 
  into #actual
  from LostAndFound.CalculateShipping('Edmonton','Calgary');

 

  --select * from #actual;
  --select * from #expected;

 

  EXEC tSQLt.AssertEqualsTable '#expected', '#actual';
  
  --EXEC tSQLt.Fail 'TODO';
END
GO