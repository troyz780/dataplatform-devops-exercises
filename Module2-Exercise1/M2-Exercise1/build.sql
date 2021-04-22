:setvar path "C:\LocalData\tsqlt\Module2-Exercise1\M2-Exercise1"

:r $(path)\create.demo.db.sql
GO
:r $(path)\LostAndFound.CalculatesShipping.sfn.sql
--:r <filename>

GO
:r $(path)\LostAndFound.schema.sql