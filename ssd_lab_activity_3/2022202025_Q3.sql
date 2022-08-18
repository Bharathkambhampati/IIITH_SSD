select w.Essn,count(*) noofprojects
from WORKS_ON w
where w.Essn in (select d.Mgr_ssn 
from DEPARTMENT d, PROJECT p
where d.Dnumber=p.Dnum and p.Pname like "ProductY")
group by  w.Essn;
