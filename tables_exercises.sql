use employees;
show tables;
describe departments;
describe dept_emp;
describe dept_manager;
describe employees;
describe salaries;
describe titles;
CHAR, VARCHAR, INT, DATE
Which table(s) do you think contain a numeric type column? salaries, dept_emp, employees, titles
Which table(s) do you think contain a string type column? employees, titles
Which table(s) do you think contain a date type column? dept_emp, dept_manager, employees, salaries, titles
What is the relationship betwen the employees and the departments tables? no relation

SQL for dept_manager table:
CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1