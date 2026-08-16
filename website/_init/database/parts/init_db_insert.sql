-- INSERT samples
INSERT INTO answer
    (date, gender, age, city, CGPA, profession, professionPressure, professionSatisfaction, sleepDuration,
        dietaryHabits, degree, historySuicidalThoughts, professionHourDaily, financialStress, historyFamilyMentalIllness,
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