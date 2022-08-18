select d1.Dnumber,d1.Dname,count(d1.Dnumber)as nooflocation
from DEPARTMENT d1 , DEPT_LOCATIONS l
where d1.Mgr_ssn in (select de.Essn
		  from DEPENDENT de,DEPARTMENT d
		  WHERE de.Sex LIKE "F" and d.Mgr_ssn=de.Essn
		  GROUP BY de.Essn
		  having count(*)>1) and d1.Dnumber=l.Dnumber
GROUP BY d1.Dnumber;
