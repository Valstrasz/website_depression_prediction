-- INSERT samples
INSERT INTO sample
    (date, gender, age, city, cgpa, profession, profession_pressure, profession_satisfaction, sleep_duration,
        dietary_habits, degree, history_thoughts_suicidal, profession_hour_daily, financial_stress, history_family_illness_mental,
        depression)
    VALUES
    ('2026/08/15', 'Male', 33, 'Visakhapatnam', 8.97, 'Student', 5, 2, '5-6 hours',
        'Healthy', 'B.Pharm', true, 3, 1, false,
        true),
    ('2026/08/15', 'Female', 24, 'Bangalore', 5.9, 'Student', 2, 5, '5-6 hours',
        'Moderate', 'BSc', false, 3, 2, true,
        false),
    ('2026/08/15', 'Male', 31, 'Srinagar', 7.03, 'Student', 3, 5, 'Less than 5 hours',
        'Healthy', 'BA', false, 9, 1, true,
        false);


INSERT INTO prediction
    (date, gender, age, city, cgpa, profession, profession_pressure, profession_satisfaction, sleep_duration,
        dietary_habits, degree, history_thoughts_suicidal, profession_hour_daily, financial_stress, history_family_illness_mental,
        depression, confidence)
    VALUES
    ('2026/01/15', 'Female', 100, 'Pripyat', 8.0, 'Student', 2.0, 4.0, '5-6 hours',
        'Healthy', 'MD', true, 5, 1, false,
        true, 87.5),
    ('2026/01/20', 'Female', 57, 'Here', 3.0, 'Student', 3.0, 1.0, '7-8 hours',
        'Unhealthy', 'BSc', false, 7, 5, true,
        true, 76),
    ('2026/01/20', 'Male', 39, 'Not here', 7.0, 'Student', 4.0, 5.0, '5-6 hours',
        'Moderate', 'BSc', false, 6, 2, true,
        true, 50),
    ('2026/03/01', 'Male', 28, 'There', 5.0, 'Student', 2.0, 0.0, '5-6 hours',
        'Moderate', 'PhD', false, 5, 4, false,
        false, 77),
    ('2026/04/03', 'Female', 35, 'Grayditch', 7.0, 'Student', 4.0, 1.0, '7-8 hours',
        'Healthy', 'M.Tech', true, 3, 3, true,
        false, 42),
    ('2026/04/03', 'Male', 63, 'Paradise Falls', 6.0, 'Student', 3.0, 1.0, '7-8 hours',
        'Unhealthy', 'M.Tech', true, 4, 3, true,
        true, 50),
    ('2026/07/15', 'Male', 70, 'Nowhere', 9.0, 'Student', 2.0, 1.0, '5-6 hours',
        'Moderate', 'BSc', true, 5, 5, false,
        true, 77.77),
    ('2026/08/16', 'Female', 24, 'White Forest', 7.0, 'Student', 3.0, 2.0, '5-6 hours',
        'Moderate', 'PhD', true, 7, 5, false,
        false, 100.00),
    ('2026/08/20', 'Male', 46, 'Red Forest', 4.0, 'Student', 3.0, 3.0, '7-8 hours',
        'Unhealthy', 'M.Tech', false, 4, 3, false,
        false, 100.00),
    ('2026/08/24', 'Female', 46, 'Tchernobyl', 10.0, 'Student', 1.0, 1.0, '5-6 hours',
        'Moderate', 'M.Tech', true, 7, 2, true,
        true, 100.00);
