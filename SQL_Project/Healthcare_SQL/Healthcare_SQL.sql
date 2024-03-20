select * from Healthcare

--- lets see which hospitals are the busiest inclusing the region and city

select Hospital_region_code,city_code_hospital,Hospital_type_code,Hospital_code,count(*) as cases
from Healthcare
group by Hospital_region_code, city_code_hospital,Hospital_type_code, Hospital_code
order by Hospital_region_code, city_code_hospital,Hospital_type_code,Hospital_code;

--- lets see which region has the heaveist load

select Hospital_region_code,count(*) as total_regional_cases
from Healthcare
group by Hospital_region_code
order by Hospital_region_code;

--- Region X has the highest number of regional cases, lets see which department has the highest number of stays

select Hospital_region_code,Department,stay,count(*) as regional_department_stay_count
from Healthcare
group by Hospital_region_code,department,stay
having stay='More than 100 Days'
order by Hospital_region_code,regional_department_stay_count desc;

--- Exploring a little further lets see which type of admission has the highest number of stays

select Hospital_region_code,department,Healthcare.[Type of Admission],stay,count(*) as regional_department_stay_count
from Healthcare
group by Hospital_region_code,department,[Type of Admission],stay
having stay='More than 100 Days'
order by Hospital_region_code,regional_department_stay_count desc;

--- lets create a new database table with the hospital information including region,city code,hospital code and hospital type code

select distinct
	Hospital_region_code,
	city_code_hospital,
	hospital_code,
	hospital_type_code,
	concat(
	Hospital_region_code,
	city_code_hospital,
	hospital_code,
	hospital_type_code) as hospital_id
into
	Hospital
from 
	Healthcare;

GO

--- now we can set the hospital_id to be the foreign key and set it into the healthcare table
alter table  Healthcare
add hospital_id varchar (10) not null;

update Healthcare
set Healthcare.hospital_id = concat(Hospital_region_code,city_code_hospital,hospital_code,hospital_type_code);
go

alter table healthcare
drop column Hospital_region_code,city_code_hospital,hospital_code,hospital_type_code;

alter table Hospital
drop constraint PK__Hospital__DFF4167FE8727EDF;
go


alter table Hospital
alter column hospital_id VARCHAR(10) not null;

alter table Hospital
add constraint hospital_id primary key (hospital_id);

alter table Healthcare
alter column hospital_id varchar(10) not null;
go

alter table Healthcare
alter column case_id float not null;

alter table Healthcare
add constraint PK_Healthcare primary key (case_id);

alter table Healthcare
add constraint FK_Healthcare_Hospital
foreign key (hospital_id)
references Hospital(hospital_id);
go

--- this makes it a little easier for us to summarize the information per unique hospital
select distinct(hospital_id) as list_of_unique_hospitals
from Healthcare;

select count(distinct(hospital_id)) as no_of_hospitals
from healthcare;

select hospital_id, count(*) as hospital_count
from Healthcare
group by hospital_id
order by hospital_count;

select hospital_id,department,count(*) as department_cases
from healthcare
group by hospital_id,department
order by hospital_id asc,department_cases desc;
--- This has made the information easier to manage and observe.
--- Further analysis can be conducted based on these changes to optimize healthcare results.
go


select distinct(ward_type)
from Healthcare;

select count(Distinct(patientid)) as total_patients
from Healthcare;

select patientid, count(*) as number_of_admissions
from Healthcare
group by patient_id
having number_of_admissions >=3;
