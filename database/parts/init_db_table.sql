-- TABLE creation
CREATE TABLE sample (
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
            
    cgpa
        NUMERIC(4,2)
            NOT NULL,
    CHECK((cgpa >= 0.0) AND (cgpa <= 10.0)),
            
    degree
        type_degree
            NOT NULL,

    profession
        type_profession
            NOT NULL,
            
    profession_hour_daily
        SMALLINT
            NOT NULL,
    CHECK((profession_hour_daily >= 0) AND (profession_hour_daily <= 24)),
            
    profession_pressure  -- Merging of 'Academic Pressure' and 'Work Pressure' columns (to create a generic column expressing the same idea)
        SMALLINT
            NOT NULL,
    CHECK((profession_pressure >= 0) AND (profession_pressure <= 5)),
            
    profession_satisfaction  -- Merging of 'Study Satisfaction' and 'Job Satisfaction' columns (to create a generic column expressing the same idea)
        SMALLINT
            NOT NULL,
    CHECK((profession_satisfaction >= 0) AND (profession_satisfaction <= 5)),
            
    financial_stress
        SMALLINT
            NOT NULL,
    CHECK((financial_stress >= 0) AND (financial_stress <= 5)),
            
    sleep_duration
        type_sleep_duration
            NOT NULL,
            
    dietary_habits
        type_dietary_habits
            NOT NULL,
            
    history_family_illness_mental
        BOOLEAN
            NOT NULL,
            
    history_thoughts_suicidal
        BOOLEAN
            NOT NULL,
            
    depression
        BOOLEAN
            NOT NULL
);



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
            
    cgpa
        NUMERIC(4,2)
            NOT NULL,
    CHECK((cgpa >= 0.0) AND (cgpa <= 10.0)),
            
    degree
        type_degree
            NOT NULL,

    profession
        type_profession
            NOT NULL,
            
    profession_hour_daily
        SMALLINT
            NOT NULL,
    CHECK((profession_hour_daily >= 0) AND (profession_hour_daily <= 24)),
            
    profession_pressure  -- Merging of 'Academic Pressure' and 'Work Pressure' columns (to create a generic column expressing the same idea)
        SMALLINT
            NOT NULL,
    CHECK((profession_pressure >= 0) AND (profession_pressure <= 5)),
            
    profession_satisfaction  -- Merging of 'Study Satisfaction' and 'Job Satisfaction' columns (to create a generic column expressing the same idea)
        SMALLINT
            NOT NULL,
    CHECK((profession_satisfaction >= 0) AND (profession_satisfaction <= 5)),
            
    financial_stress
        SMALLINT
            NOT NULL,
    CHECK((financial_stress >= 0) AND (financial_stress <= 5)),
            
    sleep_duration
        type_sleep_duration
            NOT NULL,
            
    dietary_habits
        type_dietary_habits
            NOT NULL,
            
    history_family_illness_mental
        BOOLEAN
            NOT NULL,
            
    history_thoughts_suicidal
        BOOLEAN
            NOT NULL,
            
    depression
        BOOLEAN
            NOT NULL,

    confidence
        NUMERIC(5,2)
            NOT NULL,
    CHECK((confidence >= 0.0) AND (confidence <= 100.0))
);