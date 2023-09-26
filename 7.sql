/*﻿

Business problem: Pulling employee/manager data with a self join
The VP of sales is currently contacting all of the managers who have direct reports in the Sales department to notify them of the new commission structure. Using the employees
table, which contains all employees and their associated manager, you can pull a report of all sales employees and their manager's email address using a self join. However, 
with your sharp thinking, you notice that several employees have nu11 values for their manager's email address due to the fact that some employees don't have a manager logged 
in the database.
Considering that the goal of this business problem is to spread the word about an important business change that will affect the sales team, you know that null email addresses
won't be useful in the output. I mean...how would you feel if you weren't notified of this important change because you didn't have a manager logged for you in the database? 
We can't always accept nu11 values, and sometimes we have to recode them or impute them with another value that is more meaningful for the business. Without bothering the 
super busy VP with this, you take the initiative and modify your query so that it replaces all nu11 manager emails with the employees email. This way, all sales employees 
without a manager email will receive the information directly.

﻿

Task:
Create an email list from the employees table that includes the following columns for all employees under department = "Sales".
1. employeeid employee_name
2. manager_name
3. contact_email (use the manager email if available and the employee email if not)
*/

WITH sales_emp AS (select * from employees where DEPARTMENT = 'Sales')
select e.employeeid, e.name as EMPLOYEE_NAME, m.name AS MANAGER_NAME, 
CASE WHEN m.email IS NULL THEN e.email 
     ELSE m.email
END AS CONTACT_EMAIL
from sales_emp e LEFT JOIN sales_emp m
On e.managerid = m.employeeid
