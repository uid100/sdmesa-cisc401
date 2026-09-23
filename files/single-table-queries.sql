--  1. List all the Administrators from the table

SELECT *
FROM MedicalStaff
WHERE role_name = 'Administrator';


--  2. Return a List all the Doctors from the table whose first name begins with an 'A' or a 'B'

SELECT full_name
FROM MedicalStaff
WHERE role_name = 'Doctor'
AND (full_name LIKE 'Dr. A%'
OR full_name LIKE 'Dr. B%');


--  3. Display the city and state where Sacred Heart Hospital is located

SELECT location
FROM MedicalStaff
WHERE hospital_name = 'Sacred Heart Hospital';


--  4. Display the list of show title references the name of the subject hospital (hint: not one in Seattle)

SELECT DISTINCT show_movie, hospital_name
FROM MedicalStaff
WHERE show_movie LIKE '%' + hospital_name + '%';


--  5. List the doctors in the table are listed as surgical specialties in California?

SELECT full_name, specialty_name, hospital_name
FROM MedicalStaff
WHERE role_name = 'Doctor'
AND specialty_name LIKE '%Surgery%'
AND location LIKE '%California';


--  6. How many records are listed as 'Nurse'?

SELECT COUNT(*) AS NumberOfNurses
FROM MedicalStaff
WHERE role_name = 'Nurse';


--  7. How many doctors in the table are listed as surgical specialties in California?

SELECT COUNT(*) AS NumberOfNurses
FROM MedicalStaff
WHERE role_name = 'Nurse';


--  8. How many different specialties are listed in the table?

SELECT COUNT(DISTINCT specialty_name) AS SpecialtyCount
FROM MedicalStaff;


--  9. What is the largest number of nurses listed at any single hospital?

SELECT hospital_name,
COUNT(*) AS NurseCount
FROM MedicalStaff
WHERE role_name = 'Nurse'
GROUP BY hospital_name
ORDER BY NurseCount DESC;


-- 10. List the hospitals in alphabetical order
           
SELECT hospital_name,
COUNT(*) AS NurseCount
FROM MedicalStaff
WHERE role_name = 'Nurse'
GROUP BY hospital_name;

