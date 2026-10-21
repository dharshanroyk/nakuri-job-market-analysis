-- Step 4: Analytical & Reporting Queries
USE anudip_project;

-- Query 1: Total Job Postings & Salary Disclosure Overview
SELECT 
    COUNT(job_id) AS total_postings,
    SUM(CASE WHEN salary_disclosed = TRUE THEN 1 ELSE 0 END) AS disclosed_salary_jobs,
    ROUND(SUM(CASE WHEN salary_disclosed = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(job_id), 2) AS disclosure_rate_pct,
    ROUND(AVG(CASE WHEN salary_disclosed = TRUE THEN salary_midpoint_lpa END), 2) AS avg_disclosed_salary_lpa
FROM indian_tech_jobs_2026;

-- Query 2: Market Demand & Average Compensation by Skill Domain
SELECT 
    skill_domain,
    COUNT(job_id) AS total_jobs,
    ROUND(AVG(CASE WHEN salary_disclosed = TRUE THEN salary_midpoint_lpa END), 2) AS avg_benchmark_salary_lpa
FROM indian_tech_jobs_2026
GROUP BY skill_domain
ORDER BY total_jobs DESC;

-- Query 3: Regional Hub Analysis (Bangalore, Mumbai, Pune, etc.)
SELECT 
    scraped_city,
    COUNT(job_id) AS job_count,
    ROUND(SUM(CASE WHEN is_fresher_friendly = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(job_id), 2) AS fresher_friendly_pct,
    ROUND(AVG(CASE WHEN salary_disclosed = TRUE THEN salary_midpoint_lpa END), 2) AS avg_disclosed_salary
FROM indian_tech_jobs_2026
GROUP BY scraped_city
ORDER BY job_count DESC;

-- Query 4: Experience Tier Salary Progression Analysis
SELECT 
    experience_tier,
    COUNT(job_id) AS posting_count,
    ROUND(AVG(CASE WHEN salary_disclosed = TRUE THEN salary_midpoint_lpa END), 2) AS avg_disclosed_salary_lpa,
    ROUND(AVG(skills_count), 1) AS avg_required_skills
FROM indian_tech_jobs_2026
GROUP BY experience_tier
ORDER BY avg_disclosed_salary_lpa DESC;