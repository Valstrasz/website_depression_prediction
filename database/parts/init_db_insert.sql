-- INSERT samples
INSERT INTO sample
    (date, gender, age, city, cgpa, profession, profession_pressure, profession_satisfaction, sleep_duration,
        dietary_habits, degree, history_thoughts_suicidal, profession_hour_daily, financial_stress, history_family_illness_mental,
        depression)
    VALUES
    ('2026/08/15', 'Female', 40, 'Nowhere', 7.0, 'Student', 3.0, 1.0, '5-6 hours',
        'Moderate', 'BSc', true, 7, 5, false,
        true),
    ('2026/08/15', 'Male', 42, 'Nowhere', 7.0, 'Student', 3.0, 1.0, '5-6 hours',
        'Moderate', 'BSc', true, 7, 5, false,
        true),
    ('2026/08/15', 'Female', 25, 'Somewhere', 7.0, 'Student', 3.0, 1.0, '5-6 hours',
        'Moderate', 'BSc', true, 7, 5, false,
        false);


INSERT INTO prediction
    (date, gender, age, city, cgpa, profession, profession_pressure, profession_satisfaction, sleep_duration,
        dietary_habits, degree, history_thoughts_suicidal, profession_hour_daily, financial_stress, history_family_illness_mental,
        depression, confidence)
    VALUES
    ('2026/08/15', 'Female', 777, 'AAA', 7.0, 'Student', 3.0, 1.0, '5-6 hours',
        'Moderate', 'BSc', true, 7, 5, false,
        true, 87.5),
    ('2026/08/15', 'Male', 159, 'ABC', 7.0, 'Student', 3.0, 1.0, '5-6 hours',
        'Moderate', 'BSc', true, 7, 5, false,
        true, 77.77),
    ('2026/08/15', 'Female', 3615, 'ZUGZUG', 7.0, 'Student', 3.0, 1.0, '5-6 hours',
        'Moderate', 'BSc', true, 7, 5, false,
        false, 100.00);