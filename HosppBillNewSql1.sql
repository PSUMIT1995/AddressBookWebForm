use INTERVIEW

create table HospitalBillForm(
    BillNumber int primary key NOT NULL,
	BillDate varchar(250) NULL,
	PatientName  varchar(250) NOT NULL,
	Gender varchar(250) NOT NULL,
    DOB varchar(250) NOT NULL,
	Address varchar(max) NULL,
	Email varchar(250) NOT NULL unique,
	Mobile bigint NOT NULL,

)


Create Table IvestigationTableForm(
    Sno int IDENTITY(1,1) primary key,
    Problem varchar(max),
    Fees varchar(250),
	PatientId int
)
 drop table InvestigationTableForm

create procedure GetByPatientId( 
@id int 
)
As  
BEGIN  
 select * from HospitalBillForm where BillNumber = @id
End  
GO


create procedure AddPatientForm(
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
	 select @declared = BillNumber from HospitalBillForm where Email=@Email and Mobile =@Mobile  
	 print(@declared)  
 end  
	 if (@declared = 0)  
	 begin  
			 insert into HospitalBillForm(BillNumber,BillDate,PatientName,Gender,DOB,Address,Email,Mobile) values (@BillNumber,@BillDate,@PatientName,@Gender,@DOB,@Address,@Email,@Mobile)  
			 select @declared = BillNumber from HospitalBillForm where Email=@Email and Mobile =@Mobile  
			 insert into IvestigationTableForm(Problem,Fees,PatientId) values(@disease,@Fees,@declared);  
	 end  

	 Else  
		 Begin   
			  print(@declared)  
			  insert into IvestigationTableForm(Problem,Fees,PatientId) values(@disease,@Fees,@declared);  
		 end  
End 
GO



create procedure AddProblemForm(
@Problem varchar(max),
@Fees varchar(250),
@PatientId int
)
As  
BEGIN  
 insert into IvestigationTableForm(Problem,Fees,PatientId)values(@Problem,@Fees,@PatientId);
End  



create procedure GetProblemDataForm(
@id int
)
As  
BEGIN  
 SELECT Sno,Problem,Fees FROM IvestigationTableForm WHERE PatientId = @id
End  



create procedure GetAllDiseaseListForm(
@PatientId int
)
As
BEGIN
insert into IvestigationTableForm(Problem,Fees,PatientId)Values(@Problem,@Fees,@PatientId);
END




create procedure UpdateProblemForm(
@Problem varchar(max),
@Fees varchar(250),
@Sno int
)
As
Begin
UPDATE [IvestigationTableForm] SET [Problem] = @Problem, [Fees] = @Fees WHERE [Sno] = @Sno
End
GO




create procedure DeleteProblemForm(
@Sno int
)
AS
BEGIN
DELETE FROM [IvestigationTableForm] WHERE
[Sno]=@Sno
End


Create Procedure CheckIdForm(
@id int
)
AS
BEGIN
select * from HospitalBillForm where
BillNumber = @id
END


CREATE PROCEDURE GetMaxIdForm
As  
BEGIN  
SELECT MAX(BillNumber) AS HIGHESTID FROM HospitalBillForm
End  



create procedure UpdatePatientForm(
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
 Update HospitalBillForm set BillDate=@BillData ,PatientName=@PatientName,Gender=@Gender,DOB=@DOB,Address=@Address,Email=@Email,Mobile=@Mobile where BillNumber = @BillNumber;  
END

select * from HospitalBillForm