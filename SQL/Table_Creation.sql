-- SQL/table_creation.sql
-- Step 2: Create Table Structure from Scratch

USE anudip_project;

CREATE TABLE indian_tech_jobs_2026 (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(150),
    company_name VARCHAR(150),
    company_rating DECIMAL(3,2),
    location VARCHAR(200),
    scraped_city VARCHAR(50),
    role_category VARCHAR(50),
    experience_raw VARCHAR(50),
    experience_min_yrs INT,
    experience_max_yrs INT,
    salary_raw VARCHAR(100),
    salary_min_lpa DECIMAL(10,2),
    salary_max_lpa DECIMAL(10,2),
    salary_disclosed BOOLEAN,
    skills_required TEXT,
    skills_count INT,
    job_description TEXT,
    posted_date_raw VARCHAR(50),
    work_mode VARCHAR(50),
    company_size_bucket VARCHAR(50),
    job_url TEXT,
    data_source VARCHAR(50),
    scraped_at VARCHAR(50),
    salary_tier VARCHAR(50),
    experience_tier VARCHAR(50),
    is_senior BOOLEAN,
    primary_city VARCHAR(50),
    skill_domain VARCHAR(50),
    salary_midpoint_lpa DECIMAL(10,2),
    days_since_posted INT,
    is_fresher_friendly BOOLEAN,
    salary_negotiable BOOLEAN
);