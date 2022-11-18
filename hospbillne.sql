create database INTERVIEW


Use INTERVIEW

CREATE TABLE HospitalBillData(
BillNumber int primary Key Not null,
BillDate varchar(250),
PatientName varchar(250) not null,
Gender varchar(250) not null,
DOB varchar(250) not null,
Address varchar(max),
Email varchar(250) not null unique,
Mobile bigint not null,
)

select * from HospitalBillData
CREATE TABLE Investigation(
Sno int identity(1,1) primary key,
Problem varchar(max),
Fees varchar(250),
PatientId int
)


CREATE PROCEDURE GetPatientById(@id int)
As  
BEGIN  
 select * from HospitalBillData where BillNumber = @id
End  

exec CheckId 5


exec AddPatient 5,'sdfsd','sdfdsf','adfs','dfsdf','adfafd',5698589568,'adfadfa','adsfadfasdf'
insert into HospitalBillData values(2,'sdfscd','sdfcdsf','adfcs','dfscdf','adfcafd','sdfdfcdffdsf',5698589568)



Create PROCEDURE AddProblem(  
@Problem varchar(max),
@Fees varchar(250),
@PatientId int
)  
As  
BEGIN  
 insert into Investigation(Problem,Fees,PatientId)values(@Problem,@Fees,@PatientId);
End  



CREATE PROCEDURE GetProblemData(  
@id int
)  
As  
BEGIN  
 SELECT Sno,Problem,Fees FROM Investigation WHERE PatientId = @id
End  



Create PROCEDURE GetAllDiseaseList(  
@PatientId int
)  
As  
BEGIN  
 insert into Investigation(Problem,Fees,PatientId)values(@Problem,@Fees,@PatientId);
End  



CREATE PROCEDURE UpdateProblem(
@Problem varchar(max),
@Fees varchar(250),
@Sno int
)
As
Begin
UPDATE [Investigation] SET [Problem] = @Problem, [Fees] = @Fees WHERE [Sno] = @Sno
End



CREATE PROCEDURE DeleteProblem(
@Sno int
)
As
Begin
DELETE FROM [Investigation] WHERE [Sno] = @Sno
End


CREATE PROCEDURE GetMaxId
As  
BEGIN  
SELECT MAX(BillNumber) AS HIGHESTID FROM HospitalBillData
End  



CREATE PROCEDURE UpdatePatient(  
@BillNumber int,
@BillData varchar(250),
@PatientName varchar(250),  
@Gender varchar(50),  
@DOB varchar(250),  
@Address varchar(max),  
@Email varchar(250),  
@Mobile bigint
)  
As  
BEGIN  
 Update HospitalBillData set BillDate=@BillData ,PatientName=@PatientName,Gender=@Gender,DOB=@DOB,Address=@Address,Email=@Email,Mobile=@Mobile where BillNumber = @BillNumber;  
End  



CREATE PROCEDURE AddPatient(  
@BillNumber int,
@BillDate varchar(250),
@PatientName varchar(250),  
@Gender varchar(50),  
@DOB varchar(50),  
@Address varchar(max),  
@Email varchar(250),  
@Mobile bigint,  
@disease varchar(max),  
@Fees varchar(250),  
@declared int = 0  
)  
As  
BEGIN  
  set nocount off;  
 Begin  
    select @declared = BillNumber from HospitalBillData where Email=@Email and Mobile = @Mobile  
    print(@declared)  
 end  
    if (@declared = 0)  
    begin  
            insert into HospitalBillData(BillNumber,BillDate,PatientName,Gender,DOB,Address,Email,Mobile) values (@BillNumber,@BillDate,@PatientName,@Gender,@DOB,@Address,@Email,@Mobile)  
            select @declared = BillNumber from HospitalBillData where Email=@Email and Mobile =@Mobile  
            insert into Investigation(Problem,Fees,PatientId) values(@disease,@Fees,@declared);  
            
    end  

    Else  
        Begin   
              print(@declared)  
              insert into Investigation(Problem,Fees,PatientId) values(@disease,@Fees,@declared);  
        end  
End  