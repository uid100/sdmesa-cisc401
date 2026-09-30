------------------------------------------------------------
-- Exercise 1: List Patients and Their Doctors
-- Retrieve the full names of all patients of Dr. Ashley Mitchell.
------------------------------------------------------------
SELECT 
    p.FirstName + ' ' + p.LastName AS PatientName,
    d.FirstName + ' ' + d.LastName AS DoctorName
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
WHERE d.FirstName = 'Ashley' AND d.LastName = 'Mitchell';
GO

------------------------------------------------------------
-- Exercise 2: Find Patients with Allergies
-- Which patients are allergic to Peanuts?
------------------------------------------------------------
SELECT 
    p.FirstName,
    p.LastName,
    a.AllergyType
FROM Allergies a
JOIN Patients p ON a.PatientID = p.PatientID
WHERE a.AllergyType = 'Peanuts';
GO

------------------------------------------------------------
-- Exercise 3: Find Doctors in a Specific Department
-- Which Doctors (First and Last Name) are in Paediatrics or Paediatric Surgery?
------------------------------------------------------------
SELECT 
    d.FirstName,
    d.LastName,
    dept.DepartmentName
FROM Doctors d
JOIN Departments dept ON d.DepartmentID = dept.DepartmentID
WHERE dept.DepartmentName IN ('Paediatrics', 'Paediatric Surgery');
GO

------------------------------------------------------------
-- Exercise 4: Map Doctors to Insurance Providers
-- Which insurance does Dr. Stephanie Hernandez accept?
------------------------------------------------------------
SELECT DISTINCT 
    i.ProviderName,
    i.PolicyNumber
FROM Insurance i
JOIN Patients p ON i.InsuranceID = p.InsuranceID
JOIN Appointments a ON p.PatientID = a.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
WHERE d.FirstName = 'Stephanie' AND d.LastName = 'Hernandez';
GO

------------------------------------------------------------
-- Exercise 5: Find Patients of a particular Doctor
-- Retrieve the full names of all patients of Dr. Ashley Mitchell.
------------------------------------------------------------
SELECT 
    p.FirstName + ' ' + p.LastName AS PatientName,
    d.FirstName + ' ' + d.LastName AS DoctorName
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
WHERE d.FirstName = 'Ashley' AND d.LastName = 'Mitchell';
GO

------------------------------------------------------------
-- Exercise 6: Patients with Multiple Appointments
-- Find patients who have multiple appointments.
------------------------------------------------------------
SELECT 
    p.FirstName,
    p.LastName,
    COUNT(a.AppointmentID) AS AppointmentCount
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
GROUP BY p.PatientID, p.FirstName, p.LastName
HAVING COUNT(a.AppointmentID) > 1;
GO

------------------------------------------------------------
-- Exercise 7: List the Medications Prescribed by Each Doctor
-- Retrieve the full list of medications and dosages along with the doctors who prescribed them.
------------------------------------------------------------
SELECT 
    d.FirstName + ' ' + d.LastName AS DoctorName,
    m.MedicationName,
    pr.Dosage,
    pr.Frequency
FROM Prescriptions pr
JOIN Medications m ON pr.MedicationID = m.MedicationID
JOIN Doctors d ON pr.DoctorID = d.DoctorID
ORDER BY d.LastName, m.MedicationName;
GO

------------------------------------------------------------
-- Exercise 8: Find Patients Who Have Missed Their Appointments
-- Retrieve a list of patients who have appointments marked as "Missed".
------------------------------------------------------------
SELECT 
    p.FirstName,
    p.LastName,
    a.Date AS AppointmentDate,
    a.Purpose
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
WHERE a.Status = 'Missed';
GO

------------------------------------------------------------
-- Exercise 9: Find Prescriptions for a Patient
-- What medications have been prescribed to Matthew Thompson?
------------------------------------------------------------
SELECT 
    m.MedicationName,
    pr.Dosage,
    pr.Frequency,
    pr.StartDate,
    pr.EndDate,
    d.FirstName + ' ' + d.LastName AS PrescribingDoctor
FROM Prescriptions pr
JOIN Patients p ON pr.PatientID = p.PatientID
JOIN Medications m ON pr.MedicationID = m.MedicationID
JOIN Doctors d ON pr.DoctorID = d.DoctorID
WHERE p.FirstName = 'Matthew' AND p.LastName = 'Thompson';
GO

------------------------------------------------------------
-- Exercise 10: How many patients have appointments in Radiology?
-- How many patients whose doctor belongs to a specific department.
------------------------------------------------------------
SELECT 
    COUNT(DISTINCT a.PatientID) AS PatientCount
FROM Appointments a
JOIN Doctors d ON a.DoctorID = d.DoctorID
JOIN Departments dept ON d.DepartmentID = dept.DepartmentID
WHERE dept.DepartmentName = 'Radiology';
GO