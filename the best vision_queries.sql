Let’s Start Writing the SQL Script
    
Step 1: Create Table and Insert Data

-- Create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE
);

-- Insert sample data
INSERT ALL
  INTO employees VALUES (1, 'Alice', 'HR', 5000, TO_DATE('2020-01-10', 'YYYY-MM-DD'))
  INTO employees VALUES (2, 'Bob', 'HR', 5200, TO_DATE('2020-03-15', 'YYYY-MM-DD'))
  INTO employees VALUES (3, 'Charlie', 'HR', 4900, TO_DATE('2020-05-20', 'YYYY-MM-DD'))
  INTO employees VALUES (4, 'David', 'IT', 7000, TO_DATE('2019-07-11', 'YYYY-MM-DD'))
  INTO employees VALUES (5, 'Eve', 'IT', 7200, TO_DATE('2019-09-10', 'YYYY-MM-DD'))
  INTO employees VALUES (6, 'Frank', 'IT', 6800, TO_DATE('2020-02-01', 'YYYY-MM-DD'))
  INTO employees VALUES (7, 'Grace', 'Sales', 6000, TO_DATE('2021-01-12', 'YYYY-MM-DD'))
  INTO employees VALUES (8, 'Hank', 'Sales', 6100, TO_DATE('2021-03-18', 'YYYY-MM-DD'))
  INTO employees VALUES (9, 'Ivy', 'Sales', 5900, TO_DATE('2021-05-22', 'YYYY-MM-DD'))
SELECT * FROM dual;


Step 2: LAG() and LEAD() — Compare Values
-- Compare each employee's salary with previous and next
SELECT
    emp_id,
    name,
    department,
    salary,
    prev_salary,
    next_salary,
    CASE
        WHEN salary > prev_salary THEN 'HIGHER'
        WHEN salary < prev_salary THEN 'LOWER'
        ELSE 'EQUAL'
    END AS compare_prev
FROM (
    SELECT
        emp_id,
        name,
        department,
        salary,
        LAG(salary) OVER (PARTITION BY department ORDER BY salary) AS prev_salary,
        LEAD(salary) OVER (PARTITION BY department ORDER BY salary) AS next_salary
    FROM employees
);



Step 3: RANK() vs DENSE_RANK()

    
-- Ranking employees by salary within department
SELECT
    emp_id,
    name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_salary,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank_salary
FROM employees;


Step 4: Top 3 Salaries per Department

WITH ranked_emps AS (
   SELECT * 
FROM (
    SELECT 
        emp_id,
        name,
        department,
        salary,
        join_date,
        DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
    FROM employees
) ranked_emps
WHERE salary_rank <= 3;


Step 5: First 2 Employees per Department by Join Date

WITH joined_emps AS (
   SELECT * 
FROM (
    SELECT 
        emp_id,
        name,
        department,
        salary,
        join_date,
        ROW_NUMBER() OVER (PARTITION BY department ORDER BY join_date ASC) AS join_rank
    FROM employees
) joined_emps
WHERE join_rank <= 2;


Step 6: Aggregation with Window Functions

-- Calculate max salary per department and overall
SELECT
    emp_id,
    name,
    department,
    salary,
    MAX(salary) OVER (PARTITION BY department) AS max_in_dept,
    MAX(salary) OVER () AS overall_max
FROM employees;
