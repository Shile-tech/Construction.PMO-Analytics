/*This code import the tables from the csv files by specifying the file path and the tables to 
  be inserted into.*/

USE ConstructionPMO_DB;
GO
--===============================================================================================
--  Importing data into table (projects) in the database.
--===============================================================================================

BULK INSERT projects
FROM 'C:\SQL DOCUMENTS\csv\projects.csv'
WITH (
    FIRSTROW = 2,          -- Skip header row
    FIELDTERMINATOR = ',', -- CSV comma delimiter
    ROWTERMINATOR = '\n',  -- New line = new row
    TABLOCK
);
GO
--===============================================================================================
--  Importing data into table (phase_breakdown) in the database.
--===============================================================================================

BULK INSERT phase_breakdown
FROM 'C:\SQL DOCUMENTS\csv\phase_breakdown.csv'
WITH (
    FIRSTROW = 2,          -- Skip header row
    FIELDTERMINATOR = ',', -- CSV comma delimiter
    ROWTERMINATOR = '\n',  -- New line = new row
    TABLOCK
);
GO
--===============================================================================================
--  Importing data into table (contractor_scorecard) in the database.
--===============================================================================================

BULK INSERT contractor_scorecard
FROM 'C:\SQL DOCUMENTS\csv\contractor_scorecard.csv'
WITH (
    FIRSTROW = 2,          -- Skip header row
    FIELDTERMINATOR = ',', -- CSV comma delimiter
    ROWTERMINATOR = '\n',  -- New line = new row
    TABLOCK
);
