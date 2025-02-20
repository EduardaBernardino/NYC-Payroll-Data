
1--Selecionar apenas os funcionários ativos--
2--Exibir os 10 funcionários com os maiores salários-base--
3--Calcular a soma total de salários pagos pela cidade de funcionários ativos--
4--Determinar a média salarial dos funcionários ativos--
5--Qual é o salário-base mínimo, máximo e médio por título de cargo?--
6--Qual agência gastou mais com horas extras?--
7--Quantos funcionários trabalharam mais de 100 horas extras?--
8--Qual é a distribuição dos funcionários por distrito de trabalho?--
9--Qual distrito tem o maior gasto total com salários?--
10--Média de salários-base por ano de início na agência--
11--Qual título de cargo tem o maior gasto médio com horas extras?--


--1--Selecionar apenas os funcionários ativos--
SELECT *FROM employee
WHERE leave_status = 'ACTIVE';

----------------------------------------------------------------
--2--Exibir os 10 funcionários com os maiores salários-base--
SELECT first_name, last_name, base_salary FROM employee
GROUP BY first_name, last_name, base_salary
ORDER BY  base_salary DESC
LIMIT 10;

----------------------------------------------------------------
--3--Calcular a soma total de salários pagos pela cidade de funcionários ativos--
SELECT work_location_borough, 
       SUM(regular_gross_paid) AS Total_Paid
FROM Employee
WHERE leave_status = 'ACTIVE'
GROUP BY work_location_borough;

----------------------------------------------------------------
--4--Determinar a média salarial dos funcionários ativos--
 
SELECT ROUND(AVG(base_salary),0) AS AVERAGE_SALARY
FROM Employee
WHERE leave_status = 'ACTIVE'
ORDER BY AVERAGE_SALARY;
	
----------------------------------------------------------------
--5--Qual é o salário-base mínimo, máximo e médio por título de cargo?-

SELECT title_description,
	MAX(base_salary) AS MAX_SALARY_BASE,
	MIN(base_salary) AS MIN_SALARY_BASE,
	AVG(base_salary) AS AVG_SALARY_BASE
FROM Employee
GROUP BY title_description;


----------------------------------------------------------------
--6--Qual agência gastou mais com horas extras?-- 

SELECT agency_name,
	SUM(total_ot_paid) AS  Overtime_spend
	FROM Employee
GROUP BY agency_name
ORDER BY Overtime_spend;

----------------------------------------------------------------
--7--Quantos funcionários trabalharam mais de 100 horas extras?--
SELECT COUNT (*) AS Employee_100h_OT
FROM Employee
WHERE ot_hours >100;

----------------------------------------------------------------
--8--Qual é a distribuição dos funcionários por distrito de trabalho?--

SELECT work_location_borough,
	COUNT(*) AS ALL_WORKERS
FROM Employee
GROUP BY work_location_borough
ORDER BY ALL_WORKERS DESC;

----------------------------------------------------------------
--9--Qual distrito tem o maior gasto total com salários?--
SELECT  work_location_borough, SUM(regular_gross_paid) AS Total_paid
FROM Employee
GROUP BY work_location_borough
ORDER BY Total_paid DESC
LIMIT 1;
----------------------------------------------------------------
--10--Média de salários-base por ano de início na agência--
SELECT EXTRACT (YEAR FROM agency_start_date) AS START_YEAR,
	AVG(base_salary) AS AVG_SALARY
FROM Employee
GROUP BY START_YEAR
ORDER BY START_YEAR 
LIMIT 10;

----------------------------------------------------------------

--11--Qual título de cargo tem o maior gasto médio com horas extras?--
SELECT title_description,
	AVG(total_ot_paid) AS AVG_TOTAL_PAID
FROM Employee
GROUP BY title_description
ORDER BY AVG_TOTAL_PAID DESC
LIMIT 10;




























































