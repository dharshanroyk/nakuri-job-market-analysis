# nakuri-job-market-analysis
Naukri Tech Job Market Analysis (2026) is a high-level Power BI project that analyzes the trends of tech hiring in India along with salary benchmarking and the most wanted skills. Through using Power Query,  DAX measures, it converts unstructured data of job listings into interactive dashboards consisting of KPIs, salary tiers, experience levels,
# Naukri Job Trend Analysis - Indian Tech Jobs (Power BI)

An interactive Power BI dashboard analysing 23,201 Naukri.com job postings for data and analytics roles in India.

---

## Project Information


| **Project Title**  Naukri Job Trend Analysis - Indian Tech Jobs 2026 |
| **Industry**  IT / Data & Analytics Recruitment (Job Market) |
| **Dataset Name**  `indian_tech_jobs_2026.csv` |
| **Dataset Source**  Naukri.com job listings (scraped 10 June 2025) |
| **Database Name**  `Anudip_project` (MySQL) |
| **Table Names**  `india_tech_jobs_2026` |

### Problem Statement

Hiring in India's data and analytics sector is spread across many portals, and job adverts rarely publish salaries. Job seekers, universities and employers lack a single, clear view of which roles, experience levels, cities and skills are in demand, and what they pay.

### Project Objectives

- Measure job demand by role, experience level, city and work mode.
- Benchmark disclosed salaries and measure how many employers disclose pay.
- Identify the most requested skills and skill domains.
- Document data quality issues so every figure can be traced.
- Deliver an interactive, filterable Power BI dashboard with key takeaways.

### Business Questions

- Which roles have the most openings, and which pay the most?
- How does demand and pay change with years of experience?
- Which cities and work modes (on-site, hybrid, remote) dominate?
- How many postings are open to freshers?
- How transparent are employers about salary?
- Which skills are requested most often?

---

## Tools & Technologies

- MySQL
- SQL
- Power BI Desktop
- DAX (5 measures)
- CSV files
- Excel (cleaned data workbook with data-quality checks)
---

## Project Overview

The project studies the Indian technology job market using listings collected from Naukri.com on 10 June 2025. The dataset covers six role families (Data Scientist, Data Analyst, Business Analyst, Machine Learning Engineer, Data Engineer, Python Developer) across 11 city searches.

The raw data was reviewed for quality, a cleaned star-schema model was documented, and a three-page Power BI dashboard was built to explore demand, salary, employers and geography. The analysis describes a single snapshot in time and does not claim to measure hiring outcomes.

---

## Dataset Information

| Item | Details |
|---|---|
| File | `indian_tech_jobs_2026.csv` |
| Rows x columns | 23,201 x 32 |
| Scrape date | 10-06-2025 (dd-mm-yyyy) |
| Distinct employer names | 6,993 |
| Disclosed salaries | 2,768 postings (11.9%) |

**Important columns**

| Column | Description |
|---|---|
| `job_title`, `company_name`, `company_rating` | Posting title, employer and rating (1.0-5.0) |
| `role_category` | Role family (6 values) |
| `scraped_city`, `location`, `primary_city` | Search city, advertised location, first parsed city |
| `experience_raw`, `experience_min_yrs`, `experience_max_yrs`, `experience_tier` | Experience requirement and tier |
| `salary_raw`, `salary_min_lpa`, `salary_max_lpa`, `salary_midpoint_lpa`, `salary_tier`, `salary_disclosed` | Salary text, bounds in lakhs per annum (LPA), midpoint and band |
| `skills_required`, `skills_count`, `skill_domain` | Skill tags, their count and skill grouping |
| `work_mode`, `company_size_bucket` | On-site / Hybrid / Remote; company size group |
| `posted_date_raw`, `days_since_posted` | Relative posting age |
| `is_senior`, `is_fresher_friendly` | Derived flags |

The full column-level description is in `Documentation/Data_Dictionary.xlsx`.

---

## Project Workflow

**Industry Selection → Problem Identification → Dataset Collection → MySQL Database Setup → Data Cleaning & Transformation Using SQL → SQL Data Analysis → Power BI Data Modeling → Dashboard Development → Insights & Recommendations**

---

## SQL Analysis

The data was loaded into the MySQL database `Anudip_project` as the table `india_tech_jobs_2026`. The SQL scripts are in the `SQL/` folder:

| Script | Purpose |
|---|---|
| `database_creation.sql` | Creates the `Anudip_project` database |
| `table_creation.sql` | Creates the `india_tech_jobs_2026` table |
| `data_cleaning.sql` | Cleans and transforms the raw data |
| `analysis_queries.sql` | Analysis queries |


---

## Power BI Dashboard

File: `PowerBI/Naukri_Job_trend_analysis_project_dashboard.pbix` (3 pages, 1920 x 1080).

**Data model**

- `indian_tech_jobs_2026` - the main table, with all 32 columns.
- `state_name` - holds the measures and supplies state names for the map.
- `Metric Selector` - parameter table that switches metrics on Page 1.

**DAX measures**

| Measure | Purpose |
|---|---|
| Total Jobs | Number of postings in the current filter |
| Avg Benchmark Salary (LPA) | Average salary of postings that disclose pay |
| Disclosed Salary Rate | Share of postings that disclose pay |
| Fresher Friendly Ratio | Share of postings flagged fresher friendly |
| Avg Disclosed Salary | Average disclosed salary per employer |

**Pages and visuals**

| Page | Content |
|---|---|
| Page 1 - Overview | KPI cards, experience funnel, work-mode pie chart, jobs by city, jobs by role (with Metric Selector), salary by years of experience, pivot table of experience tier by role |
| Page 2 - Employers | Scatter chart of company rating vs postings (bubble size by company size), employer table with salary range, experience tier by skill domain |
| Page 3 - Geography & Insights | India state shape map, state and experience combo chart, city and work-mode combo chart, company size by salary tier, skills-count line chart, Executive Key Takeaways text box |

**Interactivity**

- Slicers: skill domain, salary tier, company size, work mode, salary range (LPA), role, city, experience tier.
- Home and info buttons, plus a Clear All Slicers button.
- Bookmarks: Clear Filter, Insights, hide insights.

---

## Data Analysis & Visualization

- **Category-wise analysis:** postings and salary by role, skill domain and company size.
- **Distribution analysis:** experience tiers, work modes and salary bands.
- **Comparison analysis:** salary across roles and experience levels.
- **Geographic analysis:** postings by city and state.
- **KPI analysis:** total jobs, benchmark salary, disclosure rate and fresher-friendly ratio.

---

## Key Insights

All values were calculated from `indian_tech_jobs_2026.csv`.

- Data Scientist (6,455), Data Analyst (4,729) and Business Analyst (4,505) make up 67.6% of postings.
- Mid-level roles (3-5 years) are 43.6% of postings; the Fresher tier is 9.6%, and 18.0% of postings are flagged fresher friendly.
- Only 11.9% of postings disclose a salary. The average disclosed midpoint is 15.32 LPA.
- Average disclosed salary is highest for Data Scientist (18.6 LPA) and Data Engineer (17.9 LPA), and lowest for Data Analyst (10.6 LPA).
- Average disclosed salary rises with experience, from 9.6 LPA (Fresher) to 28.3 LPA (Lead/Architect).
- Bangalore, Mumbai and Chennai searches account for 42.0% of postings.
- On-site roles are 80.6% of postings; Hybrid 10.1% and Remote 9.3%.
- Python is the most requested skill tag (4,266 mentions), followed by data analysis, machine learning and SQL.

### Limitations

- The dashboard reads the raw table, which contains 2,078 duplicate postings (21,123 unique).
- 306 postings marked "Unpaid" carry a 10-18 LPA salary and are counted as disclosed (average is 15.49 LPA without them).
- Undisclosed salaries are stored as 0, so averages must be taken over disclosed rows only.
- City counts reflect scrape coverage (for example, Hyderabad has only 80 rows) as well as demand.
- The data is one portal on one date, so no time trend can be drawn.

---

## Power BI Dashboard Screenshots

Replace the file names below with your actual screenshots in the `Screenshots/` folder.

### Page 1 - Overview

<img width="1202" height="673" alt="Dashboard_Overview" src="https://github.com/user-attachments/assets/21ff42b7-2dc5-41bf-b2e1-cab4b3473cc3" />


### Page 2 - Employers

<img width="1192" height="643" alt="Company_Overview" src="https://github.com/user-attachments/assets/7b2caaa2-27c7-4221-a2c1-54d8c8e340a1" />


### Page 3 - Geography & Insights
<img width="1212" height="677" alt="State_Overview" src="https://github.com/user-attachments/assets/1caa9c06-78ae-42a7-a243-8d2508c9a0f1" />


---

## Project Folder Structure

```text
PowerBI-SQL-Project/
│
├── README.md
│
├── SQL/
│   ├── database_creation.sql
│   ├── table_creation.sql
│   ├── data_cleaning.sql
│   └── analysis_queries.sql
│
├── Dataset/
│   ├── indian_tech_jobs_2026.csv
│   ├── Indian_Tech_Jobs_Cleaned.csv
│   └── naukri_cleaned_dataset_2026.csv
│
├── PowerBI/
│   └── Naukri_Job_trend_analysis_project_dashboard.pbix
│
├── Screenshots/
│   ├── dashboard_overview.png
│   ├── page2_employers.png
│   └── page3_geography_insights.png
│
└── Documentation/
    ├── Project_Report.pdf
    └── Data_Dictionary.xlsx
```


---

## Author

- **Name:** Dharshan Roy K
- **Student ID:** AF05321869
- **Organization:** Anudip Foundation
- **Course:** DBA_AI
- **Batch Code:** ANP-D 7635
