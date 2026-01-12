SELECT * FROM SLICCOMMON.AML_SCREENING_LOG @LIVE
ORDER BY SEQ_NO DESC;
-----------------------------
SELECT DISTINCT matching_percentage 
FROM SLICCOMMON.AML_DATA_MATCHING @LIVE; 
----------------------------------------------------
SELECT * FROM SLICCOMMON.AML_DATA_MATCHING @LIVE 
WHERE matching_percentage = 100;