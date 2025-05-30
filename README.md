# 📊 SQL Window Functions Project: Hands-On Employee Data Analysis in Action

# Course Assignment: Exploring SQL Window Functions
# Group name:The Best Vision
# Collaborators: Hatunguramye Elichadai & Niyitanga Nsengiyumva Olga
# Instructor GitHub Username: EricManiraguha


## 📘 Project Overview

This project demonstrates the use of **SQL Window Functions** through analytical queries on an employee dataset. Window functions allow us to perform calculations across rows that are related to the current row without collapsing the result set — a powerful tool for analysis in modern data environments.

We used functions like `LAG()`, `LEAD()`, `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`, and aggregate functions with `PARTITION BY` to explore comparisons, rankings, and trends in our data.

---

## 📁 Dataset Description

We created a fictional **Employees** dataset containing the following fields:

| Column     | Description                    |
|------------|--------------------------------|
| emp_id     | Unique identifier for each employee |
| name       | Employee's name                |
| department | Department (HR, IT, Sales)     |
| salary     | Employee salary                |
| join_date  | The date the employee joined   |

This dataset provides a realistic structure to simulate common business scenarios in HR and analytics.

---

## 🔍 Tasks and Explanations

### 1️⃣ Compare Values with Previous or Next Records:

**Functions used**: `LAG()`, `LEAD()`

**Objective**: Compare each employee’s salary to the previous and next employee's salary in the same department.

sql
LAG(salary) OVER (PARTITION BY department ORDER BY salary)
LEAD(salary) OVER (PARTITION BY department ORDER BY salary)
Explanation:

LAG() gets the previous row’s salary.

LEAD() gets the next row’s salary.

We used a CASE statement to label each comparison as HIGHER, LOWER, or EQUAL.

💡 Real-life Application: Useful in performance reviews to analyze if an employee’s salary is above or below their peers.
#

2️⃣ Ranking Data within a Category:
Functions used: RANK(), DENSE_RANK()

Objective: Rank employees by salary within each department.

sql
Copy
Edit
RANK() OVER (PARTITION BY department ORDER BY salary DESC)
DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC)
Explanation:

RANK() skips numbers if there are ties (e.g., 1, 2, 2, 4).

DENSE_RANK() does not skip numbers (e.g., 1, 2, 2, 3).

💡 Real-life Application: Useful for promotions and performance-based bonus distribution.
#

3️⃣ Identifying Top 3 Salaries per Department:
Functions used: DENSE_RANK()

Objective: Retrieve the top 3 highest-paid employees per department.

Explanation:

We ranked employees by salary within each department and filtered where rank ≤ 3.

Using DENSE_RANK() ensures employees with the same salary are treated equally.

💡 Real-life Application: Helps identify top performers in each team.
#

4️⃣ Finding the Earliest Joiners:
Functions used: ROW_NUMBER()

Objective: Retrieve the first 2 employees who joined in each department based on the join_date.

Explanation:

We ranked employees by join date using ROW_NUMBER() and selected the top 2.

ROW_NUMBER() is ideal when you want strictly the first N rows (no ties).

💡 Real-life Application: Useful for tracking employee tenure and celebrating milestones.



 5️⃣ Aggregation with Window Functions:

Functions used: MAX() with OVER(PARTITION BY...) and OVER()

Objective:
#

5️⃣ Aggregation with Window Functions
Functions used: MAX() with OVER(PARTITION BY...) and OVER()

Objective:

Find the maximum salary in each department.

Also show the overall maximum salary in the entire company.

sql
Copy
Edit
MAX(salary) OVER (PARTITION BY department)
MAX(salary) OVER ()
Explanation:

Using PARTITION BY allows category-wise aggregation without grouping.

The overall max is applied across all rows.

💡 Real-life Application: Helps compare departmental performance with company-wide trends.






 ✅ Learning Outcome

Through this assignment, we learned how to:

Use SQL Window Functions for advanced analytics.

Perform row-wise comparisons, rankings, and aggregations.

Understand the difference between RANK, DENSE_RANK, and ROW_NUMBER.

 💡 Real-World Application Examples

HR Analytics: Salary analysis, join-date trends, performance rankings.

Sales: Track sales volume compared to previous months, identify top sellers.

Education: Compare student test scores, rank within classes or semesters.

Finance: Track stock price changes day-by-day, compute max/min per sector.

 🧑🏽‍🤝‍🧑🏽 Collaboration Summary

We worked collaboratively on:

Dataset design and population
Query writing and explanation
Documentation and GitHub version control
Both team members contributed equally. Our GitHub commit history reflects this.

  🔗 Repository Structure

sql-window-functions/
├── window_functions_assignment.sql   # Contains SQL scripts for table creation, data insertion, and window queries.
├── README.md                           # Provides an overview, key learnings, and collaboration details.
└── screenshots/                        # (Optional) Folder with visuals of query results.

---SCREENSHOTS
-- Create employees table

![create table employee](https://github.com/user-attachments/assets/d38137b2-2cd5-490d-aa63-bed5e7df2ef6).

-- Insert sample data
![insert data into employees](https://github.com/user-attachments/assets/daf69039-d796-459b-ac1b-e23808e7e968).

Step 2: LAG() and LEAD() — Compare Values
-- Compare each employee's salary with previous and next
![Lag and Lead ](https://github.com/user-attachments/assets/15632215-e892-4b99-8193-25800b3a4a3b).

Step 3: RANK() vs DENSE_RANK()
-- Ranking employees by salary within department
![Ranking](https://github.com/user-attachments/assets/0311e9c4-f24c-447b-a86b-cf67d388f238).

Step 4: Top 3 Salaries per Department
WITH ranked_emps AS (
![dense rank](https://github.com/user-attachments/assets/bf0c8550-afff-43dd-b12e-1a2d3486397c).

Step 5: First 2 Employees per Department by Join Date
WITH joined_emps AS (
![query row number](https://github.com/user-attachments/assets/ea2717ba-a834-4d77-a4fd-0502e4ad7a4f).

Step 6: Aggregation with Window Functions
-- Calculate max salary per department and overall
#![query max](https://github.com/user-attachments/assets/422793d1-47f3-4603-aea5-684ce8b7b5c1).

🔚 Conclusion & Appreciation:
This project highlighted the real-world significance of SQL window functions and provided hands-on experience in building collaborative, well-structured, and fully documented SQL solutions.
We appreciate the opportunity to apply these concepts in a practical setting.












