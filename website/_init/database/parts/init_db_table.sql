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