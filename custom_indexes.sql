USE [DBT-DW-DEV]
GO
CREATE NONCLUSTERED INDEX ix1
ON [marts].[cases] ([case_first_reg_date],[case_last_close_date])

