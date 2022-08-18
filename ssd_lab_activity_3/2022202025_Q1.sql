select DISTINCT Fname,Minit,Lname,Ssn,Dno,Dname
from EMPLOYEE e,DEPARTMENT d
WHERE d.Dnumber in (select distinct dn.Dnum from (select p.Dnum,w.Essn
              from PROJECT p ,WORKS_ON w
              where p.Pnumber=w.Pno
              group by p.Dnum,w.Essn
              having sum(w.HOURS)<40)as dn) and e.Ssn=d.Mgr_ssn;
