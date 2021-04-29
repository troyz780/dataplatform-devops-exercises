IF NOT EXISTS ( SELECT  *
                FROM    sys.schemas
                WHERE   name = N'Marketing' )
    EXEC('CREATE SCHEMA [Marketing]');
GO

