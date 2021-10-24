use project;
select * from doctorset;
select*from patientset;
select * from lab ;
desc lab;
select * from doctorset as d Left join patientset as p on d.age = p.age;
select * from doctorset cross join patientset;
select * from doctorset as d Right join patientset as p on d.age = p.age;
select * from doctorset as d Left join patientset as p on d.age = p.age
union
select * from doctorset as d Right join patientset as p on d.age = p.age;
select distinct(disease) from patientset;
select pname from patientset group by pname ;
alter table patientset add  column address varchar(20);
update patientset set address = 'pune' where pid = 1;
update patientset set address = 'mumbai' where pid = 2;
update patientset set address = 'pune' where pid = 3;
update patientset set address = 'Nashik' where pid in(4,5);
select * from patientset;
drop table lab;
select * from lab;
create table lab(
pid int ,
facility varchar(20),
cost int,
foreign key(pid) references patientset(pid) 
);
insert into lab values(1,'malaria test' , 200), (3,'blood test',300),(5,'covid test',1500),(4,'dengu  test',200),(5,'blood count', 500),(2,'common blood count', 500);
select * from lab;
select pid, facility, cost ,
case 
when cost > 100 and cost <= 500 then "price is low"
when cost > 500 and cost <= 1000 then "price is medium"
when cost > 1000 and cost <= 1500 then "price is high"
else "not correct"
end as  "price description"
from lab;
select pname , disease , age, if(age<=25 , "teenage"  , "adult") as "generation" from patientset;
update lab set cost = (case pid  
          when 2 then 600 
          when 3 then 500 
          end)
          where pid in (2,3);
select * from lab;
create table staff(
id int primary key,
name  varchar(25),
did int , 
pid int ,
foreign key(did) references doctorset(did),
foreign key(pid) references patientset(pid)
);

insert staff values(101,'meenal' , 3 , 5 ) , (102,'kartik' , 2 , 3 ) , (103,'shivangi' , 1 , 2 ) , (104,'sara' , 4 , 2 );
select * from staff ;
select staff.id as "Id" , staff.name as "Name" , 
doctorset.dname as "DoctorName" , patientset.pname as "PatientName" 
 from staff inner join  doctorset on  
 staff.did = doctorset.did inner join patientset on staff.pid = patientset.pid ;
 
 select  pname from patientset  where pid = (select pid from lab where  facility  = ' blood test' ); 
 select * from doctorset as d inner join patientset as p on d.age = p.age;
  create index dnamex on  doctorset(dname);
  show index from doctorset; 
  drop index dnamex on doctorset;
  create view staff_view as  select  id , name  from staff inner join patientset  on staff.pid = patientset.pid ;
  select * from staff_view;
  drop view staff_view;
  
  create view staff_view as  select  id , name  from staff inner join patientset  on staff.pid = patientset.pid ;
  select * from staff_view;
  
  select * from  doctorset where  dname like 's%' ;
  
   select * from  doctorset where specilization like '%t';
 select count(cost)
 from lab 
 group by cost;
 select count(room_number) , patientset from patientset  group by room_number;
 
 
 
 






