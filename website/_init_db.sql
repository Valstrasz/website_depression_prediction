-- TYPE creation
CREATE TYPE type_gender AS ENUM ('Female', 'Male', 'Other');

CREATE TYPE type_profession AS ENUM ('Architect', 'Chef', 'Civil Engineer', 'Content Writer', 'Digital Marketer', 'Doctor', 'Educational Consultant', 'Entrepreneur', 'Lawyer', 'Manager', 'Pharmacist', 'Student', 'Teacher', 'UX/UI Designer');

CREATE TYPE type_sleepDuration AS ENUM ('Less than 5 hours', '5-6 hours', '7-8 hours', 'More than 8 hours', 'Others');

CREATE TYPE type_dietaryHabits AS ENUM ('Healthy', 'Moderate', 'Unhealthy', 'Others');

CREATE TYPE type_degree AS ENUM ('B.Arch', 'B.Com', 'B.Ed', 'B.Pharm', 'B.Tech', 'BA', 'BBA', 'BCA', 'BE', 'BHM', 'BSc', 'Class 12', 'LLB', 'LLM', 'M.Com', 'M.Ed', 'M.Pharm', 'M.Tech', 'MA', 'MBA', 'MBBS', 'MCA', 'MD', 'ME', 'MHM', 'MSc', 'Others', 'PhD');



-- TABLE creation
CREATE TABLE answer (
    id
        INTEGER
            GENERATED ALWAYS AS IDENTITY,

    date
        DATE
            NOT NULL,

    gender
        type_gender
            NOT NULL,

    age
        SMALLINT
            NOT NULL,
    CHECK(age >= 0),

    city
        VARCHAR(50)
            NOT NULL,
            
    CGPA
        NUMERIC(4,2)
            NOT NULL,
    CHECK((CGPA >= 0.0) AND (CGPA <= 10.0)),

    profession
        type_profession
            NOT NULL,
            
    professionPressure  -- Merging of 'Academic Pressure' and 'Work Pressure' columns (to create a generic column expressing the same idea)
        SMALLINT
            NOT NULL,
    CHECK((professionPressure >= 0) AND (professionPressure <= 5)),
            
    professionSatisfaction  -- Merging of 'Study Satisfaction' and 'Job Satisfaction' columns (to create a generic column expressing the same idea)
        SMALLINT
            NOT NULL,
    CHECK((professionSatisfaction >= 0) AND (professionSatisfaction <= 5)),
            
    sleepDuration
        type_sleepDuration
            NOT NULL,
            
    dietaryHabits
        type_dietaryHabits
            NOT NULL,
            
    degree
        type_degree
            NOT NULL,
            
    historySuicidalThoughts
        BOOLEAN
            NOT NULL,
            
    professionHourDaily
        SMALLINT
            NOT NULL,
    CHECK((professionHourDaily >= 0) AND (professionHourDaily <= 24)),
            
    financialStress
        SMALLINT
            NOT NULL,
    CHECK((financialStress >= 0) AND (financialStress <= 5)),
            
    historyFamilyMentalIllness
        BOOLEAN
            NOT NULL,
            
    depression
        BOOLEAN
            NOT NULL
);



-- INSERT samples
INSERT INTO answer
    (date, gender, age, city, CGPA, profession, professionPressure, professionSatisfaction, sleepDuration,
        dietaryHabits, degree, historySuicidalThoughts, professionHourDaily, financialStress, historyFamilyMentalIllness,
        depression)
    VALUES
    ('2026/08/15', 'Female', 40, 'Nowhere', 7.0, 'Student', 3.0, 1.0, '5-6 hours',
        'Moderate', 'BSc', true, 7, 5, false,
        true);