select  e.Fname,e.Minit,e.Lname,e.Ssn,e.Dno,s.agg
from EMPLOYEE e, ( select e1.Super_ssn,count(*) agg
		  from EMPLOYEE e1,EMPLOYEE e2
		  WHERE e1.Super_ssn = e2.Ssn
		  GROUP BY e1.Super_ssn
		  ORDER BY agg ASC) as s
where s.Super_ssn=e.Ssn;
