-- Deliverable 1

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.titles,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
    INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- check table
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.titles

INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- check table
SELECT * FROM unique_titles;

-- Creating retiring_titles.csv
SELECT COUNT(ut.emp_no), ut.titles
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.titles
ORDER BY COUNT (ut.emp_no) DESC;

-- check table
SELECT * FROM retiring_titles;


--DELIVERALBE 2

---mentorship eligibility
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	emp.from_date,
	emp.to_date,
	t.titles
INTO mentorship_eligibility
FROM employees as e
    INNER JOIN employment as emp
	ON (e.emp_no = emp.emp_no)
	INNER JOIN titles as t
    ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
		AND (emp.to_date = '9999-01-01')
ORDER BY e.emp_no;

-- CHECK TABLE
SELECT * FROM mentorship_eligibility;


