-- Step 3: Data Cleaning & Feature Engineering
USE anudip_project;

-- Fix zero ratings for cleaner aggregation
UPDATE indian_tech_jobs_2026
SET company_rating = NULL
WHERE company_rating = 0;

-- Standardize City Names (e.g., Bengaluru -> Bangalore)
UPDATE indian_tech_jobs_2026
SET primary_city = 'Bangalore'
WHERE scraped_city IN ('Bengaluru', 'Bangalore');

-- Create High Salary Indicator Flag for Disclosed Roles (>= 15 LPA)
ALTER TABLE indian_tech_jobs_2026 ADD COLUMN is_high_pay_disclosed BOOLEAN;

UPDATE indian_tech_jobs_2026
SET is_high_pay_disclosed = CASE 
    WHEN salary_midpoint_lpa >= 15.0 AND salary_disclosed = TRUE THEN TRUE 
    ELSE FALSE 
END;