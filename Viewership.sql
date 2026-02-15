SELECT*
FROM
  "HEALTHS"."INSURANCE"."CLAIMS"
LIMIT
  10;
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 
 ---Age Distribution and Procedures--
 SELECT 
    -- Use the cleaned age column for analysis
    CAST(REPLACE(PatientAge, ' ', '') AS INT) AS Patient_Age,
    ProcedureCode,
    COUNT(*) AS Total_Claims_Count,
    SUM(ClaimAmount) AS Total_Revenue,
    AVG(ClaimAmount) AS Average_Claim_Amount
FROM
    HEALTHS.INSURANCE.CLAIMS
WHERE
    CAST(REPLACE(PatientAge, ' ', '') AS INT) IS NOT NULL
GROUP BY
    CAST(REPLACE(PatientAge, ' ', '') AS INT),
    ProcedureCode
ORDER BY
    Patient_Age,
    Total_Claims_Count DESC;
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
    ----------------------------------------------------------------------------------------------------------------------
    SELECT
    PatientAge,
    ProcedureCode,
    COUNT(*) AS Total_Claims_Count,
    SUM(ClaimAmount) AS Total_Revenue,
    AVG(ClaimAmount) AS Average_Claim_Amount
FROM
    HEALTHS.INSURANCE.CLAIMS
WHERE
    PatientAge IS NOT NULL
GROUP BY
    PatientAge,
    ProcedureCode
ORDER BY
    PatientAge,
    Total_Claims_Count DESC;

        
        
        
 
 

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------Age and Gender of patients---
  SELECT
    PatientAge,
    PatientGender,
    COUNT(CLAIMID) AS Total_Claims,
    AVG(ClaimAmount) AS Avg_Claim_Amount 
FROM
    HEALTHS.INSURANCE.CLAIMS
GROUP BY
    PatientAge,
    PatientGender
ORDER BY
    PatientAge,
    PatientGender;
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --TOP 10 HIGH REVENUE DIAGNOSIS CODES---
    SELECT DIAGNOSISCODE,
    COUNT(CLAIMID) AS Total_Claims,
    SUM(CLAIMAMOUNT) AS Total_Claims_Amount,
    AVG(CLAIMAMOUNT) AS Avg_Claim_Amount
FROM
    HEALTHS.INSURANCE.CLAIMS
GROUP BY
    DIAGNOSISCODE
ORDER BY
    Total_Claims_Amount DESC
LIMIT 10;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------CLAIMS DISTRIBUTION BY AGE------
SELECT
    PatientAge AS Patients_Age,
    PatientGender AS Patients_Gender,
    COUNT(CLAIMID) AS Total_Claims,
    AVG(CLAIMAMOUNT) AS Avg_Claim_Amount
FROM
    HEALTHS.INSURANCE.CLAIMS
GROUP BY
    PatientAge,
    PatientGender
ORDER BY
    PatientAge,
    PatientGender;
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ----Provider Speciality Impact on Claims Amount--
    SELECT PROVIDERSPECIALTY AS pROVIDER_sPECIALTY,
    COUNT(CLAIMID) AS Total_Claims,
    SUM(CLAIMAMOUNT) AS Total_Amount,
    AVG(CLAIMAMOUNT) AS Avg_Claim_Amount
FROM
    HEALTHS.INSURANCE.CLAIMS
GROUP BY
    PROVIDERSPECIALTY
HAVING
    COUNT(CLAIMID) > 50 
ORDER BY
    Avg_Claim_Amount DESC
LIMIT 10;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------Total Revenue and Total Claims by Year---
SELECT
    ClaimDate AS Claims_Date,
    COUNT(CLAIMID) AS Total_Claims,
    SUM(CLAIMAMOUNT) AS Total_Revenue,
    AVG(CLAIMAMOUNT) AS Avg_Claim_Value
FROM
    HEALTHS.INSURANCE.CLAIMS
GROUP BY
    ClaimDate
ORDER BY
    ClaimDate; 
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    SELECT
    YEAR(TO_DATE(ClaimDate, 'YYYY/MM/DD')) AS ClaimYear,
    MONTH(TO_DATE(ClaimDate, 'YYYY/MM/DD')) AS ClaimMonth,
    COUNT(ClaimID) AS Claims_Volume,
    SUM(ClaimAmount) AS Monthly_Claims_Amount
FROM
    HEALTHS.INSURANCE.CLAIMS
GROUP BY
    YEAR(TO_DATE(ClaimDate, 'YYYY/MM/DD')),
    MONTH(TO_DATE(ClaimDate, 'YYYY/MM/DD'))
ORDER BY
    ClaimYear,
    ClaimMonth;
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------Claims Concentration by Provider Location--
    SELECT
    PROVIDERLOCATION AS Provider_Location,
    COUNT(CLAIMID) AS Claims_Count,
    SUM(CLAIMAMOUNT) AS Total_Revenue_Location
FROM
    HEALTHS.INSURANCE.CLAIMS
GROUP BY
    PROVIDERLOCATION
ORDER BY
    Total_Revenue_Location DESC 
LIMIT 20;
 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------Claims by Marital Status and Employment
SELECT
    PatientMaritalStatus AS Marital_Status,
    PATIENTEMPLOYMENTSTATUS AS Employment_Status,
    COUNT(ClaimID) AS Claims_Count,
    AVG(CLAIMAMOUNT) AS Avg_Claim
FROM
    HEALTHS.INSURANCE.CLAIMS
GROUP BY
    PatientMaritalStatus,
    PATIENTEMPLOYMENTSTATUS
ORDER BY
    Claims_Count DESC;