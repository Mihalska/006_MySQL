use MyJoinsDB;

CREATE VIEW Person   
AS SELECT phone, (select adress from Informations where Employees.Employees_id=Informations.informations_id) as adress  
FROM Employees;
drop view Person  ;
select * from Person ;
 
 CREATE VIEW Status
 AS SELECT Employees.LName, Informations.birthday, Employees.phone from Informations
 inner join Employees on Informations.informations_id= Employees.Employees_id
 where Informations.status   = 'Неодружений';
   
select * from Status ;
   
   CREATE VIEW Datail
   AS SELECT  Employees.LName, Informations.birthday, Employees.phone from Salaryes inner join 
   Informations on Salaryes.salaryes_id = Informations.informations_id 
   inner join Employees on Informations.informations_id= Employees.Employees_id
   where Salaryes.position   = 'Менеджер';
   
    select * from Datail ;
    
    
    

   
   
   
 
 
 
 
 
