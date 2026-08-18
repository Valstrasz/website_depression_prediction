-- TYPE creation
CREATE TYPE type_gender
AS ENUM ('Female', 'Male', 'Other');

CREATE TYPE type_profession
AS ENUM ('Architect', 'Chef', 'Civil Engineer', 'Content Writer', 'Digital Marketer', 'Doctor', 'Educational Consultant', 'Entrepreneur', 'Lawyer', 'Manager', 'Pharmacist', 'Student', 'Teacher', 'UX/UI Designer');

CREATE TYPE type_sleep_duration
AS ENUM ('Less than 5 hours', '5-6 hours', '7-8 hours', 'More than 8 hours', 'Others');

CREATE TYPE type_dietary_habits
AS ENUM ('Healthy', 'Moderate', 'Unhealthy', 'Others');

CREATE TYPE type_degree
AS ENUM ('B.Arch', 'B.Com', 'B.Ed', 'B.Pharm', 'B.Tech', 'BA', 'BBA', 'BCA', 'BE', 'BHM', 'BSc', 'Class 12', 'LLB', 'LLM', 'M.Com', 'M.Ed', 'M.Pharm', 'M.Tech', 'MA', 'MBA', 'MBBS', 'MCA', 'MD', 'ME', 'MHM', 'MSc', 'Others', 'PhD');