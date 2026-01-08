CREATE TABLE SLI_APPS.AAA AS (
SELECT fullname, dob, idnum, phmob, email, agency, ornum, branch, oldagt, usr_category, 
(CASE WHEN TRIM(UPPER(stid)) = 'OR' THEN (
SELECT RTRIM(XMLAGG(XMLELEMENT(e, agency || ' - ' || fullname || ', ').EXTRACT('//text()') ORDER BY agency).GetClobVal(), ', ') 
FROM (SELECT agency, TRIM(CONCAT(CONCAT(TRIM(status), TRIM(int)), TRIM(name))) AS fullname 
FROM AGENT.AGENT WHERE STCD NOT IN (10, 9, 8, 5) AND TRIM(UPPER(stid)) != 'OR' AND ORNUM = (SELECT DISTINCT ornum FROM AGENT.AGENT 
WHERE STCD NOT IN (10, 9, 8, 5) AND TRIM(email) = TRIM('gcedirisinghe20@gmail.com') AND TRIM(UPPER(stid)) = 'OR'))) END) AS attached_users 
FROM (
SELECT TRIM(CONCAT(CONCAT(TRIM(status), TRIM(int)), TRIM(name))) AS fullname, dob, idnum, phmob, email, agency, ornum, branch, stcd, newagt as oldagt, stid, 
(CASE WHEN TRIM(UPPER(stid)) = 'AG' THEN 'Advisor' WHEN TRIM(UPPER(stid)) = 'OR' THEN 'Organisor' END) AS usr_category
FROM AGENT.AGENT WHERE STCD NOT IN (10, 9, 8, 5) AND
TRIM(email) = TRIM('gcedirisinghe20@gmail.com'))
WHERE stcd = 0);
----------------------------------
COMMIT;
--------------------------------------------------------------------------
INSERT INTO SLI_APPS.AAA (
SELECT fullname, dob, idnum, phmob, email, agency, ornum, branch, oldagt, usr_category, 
(CASE WHEN TRIM(UPPER(stid)) = 'OR' THEN (
SELECT RTRIM(XMLAGG(XMLELEMENT(e, agency || ' - ' || fullname || ', ').EXTRACT('//text()') ORDER BY agency).GetClobVal(), ', ') 
FROM (SELECT agency, TRIM(CONCAT(CONCAT(TRIM(status), TRIM(int)), TRIM(name))) AS fullname 
FROM AGENT.AGENT WHERE STCD NOT IN (10, 9, 8, 5) AND TRIM(UPPER(stid)) != 'OR' AND ORNUM = (SELECT DISTINCT ornum FROM AGENT.AGENT 
WHERE STCD NOT IN (10, 9, 8, 5) AND TRIM(email) = TRIM('anthonyk@slic.lk') AND TRIM(UPPER(stid)) = 'OR'))) END) AS attached_users 
FROM (
SELECT TRIM(CONCAT(CONCAT(TRIM(status), TRIM(int)), TRIM(name))) AS fullname, dob, idnum, phmob, email, agency, ornum, branch, stcd, newagt as oldagt, stid, 
(CASE WHEN TRIM(UPPER(stid)) = 'AG' THEN 'Advisor' WHEN TRIM(UPPER(stid)) = 'OR' THEN 'Organisor' END) AS usr_category
FROM AGENT.AGENT WHERE STCD NOT IN (10, 9, 8, 5) AND
TRIM(email) = TRIM('anthonyk@slic.lk')));
---------------------------
COMMIT;
----------------------------------------------
SELECT * FROM SLI_APPS.AAA WHERE email = 'anthonyk@slic.lk';
--------------------------------------------------------------------
SELECT DBMS_METADATA.GET_DDL('TABLE','AAA') FROM DUAL;
---------------------------
CREATE TABLE SLI_APPS.AAA_BK AS SELECT * FROM SLI_APPS.AAA;
COMMIT;
---------------------------------------
CREATE TABLE SLI_APPS.AAA_EXCEPTIONS (
p_username VARCHAR2(100),
p_error VARCHAR2(4000));
--------------------------
COMMIT;
----------------------------
SELECT * FROM SLI_APPS.LOGS;