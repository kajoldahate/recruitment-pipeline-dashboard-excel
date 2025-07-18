CREATE TABLE applicant_data (
    applicant_id SERIAL PRIMARY KEY,
    applicant_name VARCHAR(100),
    process VARCHAR(100),
    recruiter_name VARCHAR(100),
    cv_submission_date DATE,
    interview_date DATE,
    hired_date DATE,
    salary_offered INTEGER,
    sources VARCHAR(100),
    stages VARCHAR(100),
    status VARCHAR(50),
    gender VARCHAR(10),
    dob DATE,
    email_id VARCHAR(100) UNIQUE
);


COPY applicant_data
FROM 'F:/power bi/hr/hr2/New folder/applicant_data.csv'
DELIMITER ','
CSV HEADER
QUOTE '"';


select * from applicant_data

CREATE TABLE employee_data2 (
employee_id SERIAL PRIMARY KEY,
emp_name  VARCHAR(100),
"10th_marksheet"  VARCHAR(100),
"12th_marksheet"  VARCHAR(100),
graduation_marksheet  VARCHAR(100),
education   VARCHAR(100),
address   VARCHAR(100),
location   VARCHAR(100),
pincode  INTEGER,
city   VARCHAR(100),
state VARCHAR(100),
Marital_Status  VARCHAR(100),
addhaar_card   VARCHAR(100),
pan_card VARCHAR(100)
);



ALTER TABLE employee_data2
ALTER COLUMN employee_id TYPE VARCHAR(20);


COPY employee_data2
FROM 'F:\power bi\hr\hr2\New folder\employee_data2.csv'
DELIMITER ','
CSV HEADER
QUOTE '"';


select * from employee_data2

select count(*) as hired_count
from applicant_data
where stages = 'hired';

select count(applicant_id) as total_application
from applicant_data;

SELECT 
  ROUND(
    (SELECT COUNT(*) FROM applicant_data WHERE stages = 'hired') * 100.0 /
    (SELECT COUNT(*) FROM applicant_data),
    2
  ) AS application_to_hired_rate;