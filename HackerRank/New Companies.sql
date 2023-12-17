SELECT
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code) AS lead_managers,
    COUNT(DISTINCT sm.senior_manager_code) AS senior_managers,
    COUNT(DISTINCT m.manager_code) AS managers,
    COUNT(DISTINCT e.employee_code) AS employees
FROM
    Company c
LEFT JOIN
    Lead_Manager lm ON c.company_code = lm.company_code
LEFT JOIN
    Senior_Manager sm ON lm.lead_manager_code = sm.lead_manager_code AND lm.company_code = sm.company_code
LEFT JOIN
    Manager m ON sm.senior_manager_code = m.senior_manager_code AND sm.lead_manager_code = m.lead_manager_code AND sm.company_code = m.company_code
LEFT JOIN
    Employee e ON m.manager_code = e.manager_code AND m.senior_manager_code = e.senior_manager_code AND m.lead_manager_code = e.lead_manager_code AND m.company_code = e.company_code
GROUP BY
    c.company_code, c.founder
ORDER BY
    c.company_code;
