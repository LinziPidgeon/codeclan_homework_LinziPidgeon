--SQL Day 2 Lab and Homework

--Question 1.
--(a). Find the first name, last name and team name of employees who are members of teams.
SELECT 
    e.first_name,
    e.last_name,
    t.name AS team_name
FROM employees AS e INNER JOIN teams AS t 
    ON e.team_ID = t.id
    ORDER BY e.first_name ASC NULLS LAST, e.last_name ASC NULLS LAST;
    
--(b). Find the first name, last name and team name of employees who are members of teams and are enrolled in the pension scheme.
SELECT 
    e.first_name,
    e.last_name,
    t.name AS team_name
FROM employees AS e INNER JOIN teams AS t 
    ON e.team_ID = t.id
WHERE e.pension_enrol = TRUE 
    ORDER BY e.first_name ASC NULLS LAST, e.last_name ASC NULLS LAST;

-- (c). Find the first name, last name and team name of employees who are members of teams, where their team has a charge cost greater than 80.
SELECT 
    e.first_name,
    e.last_name,
    t.name AS team_name,
     t.charge_cost
FROM employees AS e INNER JOIN teams AS t 
    ON e.team_ID = t.id
WHERE CAST(t.charge_cost AS int) > 80
ORDER BY e.first_name ASC NULLS LAST, e.last_name ASC NULLS LAST;



--Question 2.
--(a). Get a table of all employees details, together with their local_account_no and local_sort_code, if they have them.
SELECT
    e.*,
    p_d.local_account_no,
    p_d.local_sort_code 
FROM (employees AS e LEFT JOIN pay_details AS p_d 
    ON e.pay_detail_id = p_d.id);
    
--(b). Amend your query above to also return the name of the team that each employee belongs to.
SELECT
    e.*,
    p_d.local_account_no,
    p_d.local_sort_code,
    t.name AS team_name
FROM (employees AS e LEFT JOIN pay_details AS p_d 
    ON e.pay_detail_id = p_d.id)
LEFT JOIN teams AS t  
   ON e.team_ID = t.id;
   
   
   
--Question 3.
--(a). Make a table, which has each employee id along with the team that employee belongs to.
SELECT 
    e.id AS employee_id,
    t.name AS team_name
FROM employees AS e LEFT JOIN teams AS t 
    ON e.team_ID = t.id;
    
--(b). Breakdown the number of employees in each of the teams.
SELECT 
    count(e.id) AS number_of_employees,
    t.name AS team_name
FROM employees AS e LEFT JOIN teams AS t 
    ON e.team_ID = t.id
GROUP BY t.name;

-- (c). Order the table above by so that the teams with the least employees come first
SELECT 
    count(e.id) AS number_of_employees,
    t.name AS team_name
FROM employees AS e LEFT JOIN teams AS t 
    ON e.team_ID = t.id
GROUP BY t.name
ORDER BY number_of_employees ASC NULLS LAST;



--Question 4.
--(a). Create a table with the team id, team name and the count of the number of employees in each team.
SELECT 
    t.id AS team_id,
    t.name AS team_name,
    count(e.id) AS number_of_employees
FROM teams AS t LEFT JOIN employees AS e  
    ON t.id = e.team_ID
GROUP BY t.id
ORDER BY t.id ASC NULLS LAST;

-- (b). The total_day_charge of a team is defined as the charge_cost of the team multiplied by the number of employees in the team. 
--Calculate the total_day_charge for each team.
SELECT 
    t.id AS team_id,
    t.name AS team_name,
    t.charge_cost,
    count(e.id) AS number_of_employees,
    CAST(t.charge_cost AS int)*count(e.id) AS total_day_charge
    FROM teams AS t LEFT JOIN employees AS e  
    ON t.id = e.team_ID
GROUP BY t.id
ORDER BY t.id ASC NULLS LAST;

--(c). How would you amend your query from above to show only those teams with a total_day_charge greater than 5000?
SELECT 
    t.id AS team_id,
    t.name AS team_name,
    t.charge_cost,
    count(e.id) AS number_of_employees,
    CAST(t.charge_cost AS int)*count(e.id) AS total_day_charge
FROM teams AS t LEFT JOIN employees AS e  
ON t.id = e.team_ID
GROUP BY t.id
HAVING CAST(t.charge_cost AS int)*count(e.id) > 5000
ORDER BY total_day_charge DESC;




--2 Extension

--Question 5.
--How many of the employees serve on one or more committees?
SELECT
COUNT(DISTINCT employee_id) AS no_distinct_employees_in_committees
FROM employees_committees;



--Question 6.
-- How many of the employees do not serve on a committee?

SELECT 
COUNT(e.id) AS no_employees_not_on_committees
FROM employees AS e LEFT JOIN employees_committees AS e_c  
    ON e.id = e_c.employee_id
WHERE committee_id IS NULL;
