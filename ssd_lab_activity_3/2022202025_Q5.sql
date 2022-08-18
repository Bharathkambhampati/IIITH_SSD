select d.Mgr_ssn,d.Dnumber,count(*) noofdep 
 from DEPENDENT de,(select Mgr_ssn,Dnumber
		from DEPARTMENT
		where Dnumber in (select Dnumber 
		from DEPT_LOCATIONS
		group by Dnumber
		having count(*)>1)) as d
 where de.Essn=d.Mgr_ssn
 group by d.Mgr_ssn,d.Dnumber;
