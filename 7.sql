WITH sales_emp AS (select * from employees where DEPARTMENT = 'Sales')
select e.employeeid, e.name as EMPLOYEE_NAME, m.name AS MANAGER_NAME, 
CASE WHEN m.email IS NULL THEN e.email 
     ELSE m.email
END AS CONTACT_EMAIL
from sales_emp e LEFT JOIN sales_emp m
On e.managerid = m.employeeid
