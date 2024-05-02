create database HR;
select * from hr_1 ;
select * from hr_2;

/* KPI 1
Average Attrition rate for all Departments 
*/
SELECT department,concat(round(AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100,2),"%") AS attrition_rate
FROM hr_1
GROUP BY department;
 
/* KPI 2
Average Hourly rate of Male Research Scientist
 */

SELECT jobrole,round(AVG(hourlyrate),2) AS average_hourly_rate
FROM hr_1
WHERE gender = 'Male' AND jobrole = 'Research Scientist'; 

/* KPI 3
Attrition rate Vs Monthly income stats
 */
 Create table HR_Merge as
select  * from hr_1 inner join hr_2 on hr_1.EmployeeNumber=hr_2.EmployeeID;

SELECT department,concat(round(AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100,2),"%") AS attrition_rate,
round(avg(MonthlyIncome)) as Montly_Income
FROM hr_merge
GROUP BY department;


/* KPI 4
Average working years for each Department
*/
select department,round(avg(TotalWorkingYears),2) as Working_Year from hr_merge
group by department;

/* KPI 5
Job Role Vs Work life balance
*/

select JobRole,round(avg(WorkLifeBalance),2) as Work_Life_Balance from hr_merge
group by jobrole;

/* KPI 6
Attrition rate Vs Year since last promotion relation
*/
SELECT  department,avg(YearsSinceLastPromotion) as Avg_YearsSinceLastPromotion,
concat(round(AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100,2),"%") AS attrition_rate
FROM hr_merge
GROUP BY department;




    