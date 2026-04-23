
/*This code was written to create tables specifying the data_types, constraints, and the primary keys 
  in my database.*/

USE ConstructionPMO_DB; -- instruct to use already created database.
GO

--===============================================================================================
--  Creating table (projects) in the database.
--===============================================================================================

CREATE TABLE projects 
(
	project_id VARCHAR(20) PRIMARY KEY NOT NULL,
	project_name VARCHAR(100) NOT NULL,
	project_type VARCHAR(50) NOT NULL,
	state VARCHAR(20) NOT NULL,
	contractor VARCHAR(100) NOT NULL,
	consultant VARCHAR(100) NOT NULL,
	year_start INT NOT NULL,
	budget_NGN DECIMAL (18, 2) NOT NULL,
	actual_cost_NGN DECIMAL (18, 2) NOT NULL,
	cost_overrun_NGN DECIMAL (18, 2),
	planned_dur_months INT NOT NULL,
	act_dur_months INT NOT NULL,
	sched_delay_months INT,
	perct_completed DECIMAL (10,2) CHECK(perct_completed BETWEEN 0 AND 100),
	prim_delay_reas VARCHAR(100),
	status VARCHAR(15) NOT NULL
);
GO
--===============================================================================================
--  Creating table (phase_breakdown) in the database.
--===============================================================================================

CREATE TABLE phase_breakdown 
(
	project_id VARCHAR(20) NOT NULL,
	phase VARCHAR(100) NOT NULL,
	phase_budget_NGN DECIMAL (18,2) NOT NULL,
	phase_actual_NGN DECIMAL (18,2) NOT NULL,
	phase_overrun_NGN DECIMAL (18,2),
	phase_overrun_pct DECIMAL (10,2),
	PRIMARY KEY (project_id, phase),
	FOREIGN KEY (project_id) REFERENCES projects (project_id)
);
GO
--===============================================================================================
--  Creating table (contractor_scorecard) in the database.
--===============================================================================================

CREATE TABLE contractor_scorecard 
(
	contractor VARCHAR(100) PRIMARY KEY,
	project_handled INT NOT NULL,
	total_budget_NGN DECIMAL (18,2) NOT NULL,
	total_actual_NGN DECIMAL (18,2) NOT NULL,
	avg_cost_overrun_pct DECIMAL (10,2),
	avg_planned_dur DECIMAL (10,2) NOT NULL,
	avg_actual_dur DECIMAL (10,2) NOT NULL,
	delay_rate_pct DECIMAL (10,2) CHECK(delay_rate_pct BETWEEN 0 AND 100),
	perform_score DECIMAL (10,2) CHECK(perform_score BETWEEN 0 AND 100)
);
