create database fastFood collate persian_100_BIN
use fastFood
create table ghaza(
	codeGhaza int primary key NOT NULL,
	onvanGhaza nvarchar(50) NOT NULL UNIQUE
)
insert into ghaza VALUES 
(101,'سیب زمینی تنوری'),
(102,'سیب زمینی سرخ شده'),
(103,'سیب پنیری'),
(104,'کراکف'),
(105,'پیتزا مخلوط'),
(106,'پیتزا گوشت و قارچ'),
(107,'پیتزا فیله مرغ '),
(108,'پیتزا رست بیف'),
(109,'نودل سبزیجات'),
(110,'نودل مرغ'),
(111,'قارچ سوخاری')
create table moshtari(
	codeM int primary key NOT NULL,
	nam nvarchar(30) NOT NULL,
	famil nvarchar(30),
	adres nvarchar(200)
	
)
insert into moshtari values
(1,'ندا','محمودی','بندرعباس-سیدکامل'),
(2,'مرضیه','نورالدینی','بندرعباس-رسالت جنوبی'),
(3,'ثریا','بابایی','بندرعباس-پارک شهر'),
(4,'رضا','صبور','بندرعباس-مرکز شهر-سیتی سنتر'),
(5,'اضغر','بارانی','بندرعباس-درخت سبز'),
(6,'یاسمن','نجفی','بندرعباس-22بهمن'),
(7,'موسی','بهرامی','بندرعباس-رسالت شمالی'),
(8,'مهسا','پورملایی','بندرعباس-فلکه برق'),
(9,'بهار','بهادری','بندرعباس-22بهمن'),
(10,'ستاره','سیماپناه','بندرعباس-شهرک توحید'),
(11,'معصومه','راد','بندرعباس-شهرک نور'),
(12,'محمدعلی','رشکن','بندرعباس-بعثت'),
(13,'دانیال','مهدی پور','بندرعباس-مصطفی خمینی'),
(14,'خدیجه','احترامی','بندرعباس-کوی پرواز'),
(15,'علیرضا','خسروانی','بندرعباس-شهرک امام رضا'),
(16,'البرز','رهنورد','بندرعباس-سراه برق'),
(17,'مهتاب','برزویی','بندرعباس-رسالت جنوبی'),
(18,'نیما','میرزایی','بندرعباس-میدان 12 فروردین'),
(19,'رمضان','دریانژاد','بندرعباس-9دی'),
(20,'ستاره','سیماپناه','بندرعباس-شهرک توحید')
create table sefaresh(
	codeM int NOT NULL,
	codeGhaza int NOT NULL,
	 gheymat int NOT NULL,
	 tedad tinyint DEFAULT 0,
	 tarikh ntext NOT NULL
	 primary key(codeM,codeGhaza)

)
alter table sefaresh
add constraint sefaresh_fk_codeMoshtari
foreign key (codeM)references moshtari(codeM)

alter table sefaresh
add constraint sefaresh_fk_codeGhaza
foreign key (codeGhaza)references ghaza(codeGhaza)

insert into sefaresh values
(1,111,50000,2,'1401-01-25')
insert into sefaresh values
(5,101,70000,1,'1401-1-26'),
(9,110,45000,4,'1401-2-17'),
(20,105,150000,1,'1401-2-29')
insert into sefaresh values
(1,106,130000,3,'1401-3-3'),
(17,103,68000,2,'1401-3-5')
insert into sefaresh values 

(17,110,45000,1,'1401-3-5'),
(12,104,59000,2,'1401-4-10'),
(6,102,62000,4,'1401-5-14'),
(14,107,135000,1,'1401-5-2'),
(4,108,148000,1,'1401-5-18'),
(2,109,42000,2,'1401-6-1'),
(3,105,150000,1,'1401-6-2'),
(16,111,50000,5,'1401-6-13'),
(15,104,59000,3,'1401-6-16'),
(3,102,62000,1,'1401-7-1'),
(8,110,45000,2,'1401-7-10'),
(13,106,130000,10,'1401-7-12'),
(19,106,130000,2,'1401-7-16'),
(20,111,50000,3,'1401-8-4'),
(11,102,62000,2,'1401-8-4'),
(11,111,50000,1,'1401-8-4'),
(8,101,70000,1,'1401-1-10')
create table personel(
	codeP int primary key NOT NULL,
	namP nvarchar(30),
	familP nvarchar(30),
	adresP nvarchar(200),
	hoghoogh int NOT NULL,
	updateDate DateTime NULL
)
insert into personel 
(codeP,namP,familP,adresP,hoghoogh)
values 
(3001,'رعنا','یحیایی','بندرعباس',2000000),
(3002,'سیما','مرادی','بندرعباس',2000000),
(3003,'احمد','نوری','بندرعباس',2000000),
(4001,'شهرام','ملاپور','بندرعباس',3000000),
(4002,'سینا','مریدی','بندرعباس',3000000),
(5001,'نگین','شیرازی','بندرعباس',5000000)

create table mavadAvalie(
	codeMavad int NOT NULL,
	codeP int NOT NULL,
	onvan nvarchar(30),
	meghdar tinyint,
	noeMeghdar nvarchar(20),
	taarikh ntext,
	gheymatMavad int
	
    primary key(codeP,codeMavad)
)
alter table mavadAvalie
add constraint mavadAvalieh_fk_codePersonel
foreign key (codeP)references personel(codeP)

insert into mavadAvalie values
(201,4001,'آرد',50,'کیلوگرم','1400-1-30',2000),
(202,4001,'نان باگت',100,'عدد','1401-1-31',3000),
(203,4002,'گوشت',20,'کیلوگرم','1401-2-10',120000),
(204,4001,'مرغ',30,'کیلوگرم','1401-2-30',80000),
(205,4002,'سییب زمینی',25,'کیلوگرم','1401-3-14',8000),
(206,4001,'هات داگ',100,'عدد','1401-3-20',5000),
(207,4001,'قارچ',15,'کیلوگرم','1401-4-5',15000),
(208,4001,'رشته',30,'بسته','1401-1-30',20000),

(201,4002,'آرد',50,'کیلوگرم','1401-7-12',3500),
(202,4002,'نان باگت',100,'عدد','1401-1-15',5500),
(203,4001,'گوشت',20,'کیلوگرم','1401-2-10',150000),

(204,4002,'مرغ',30,'کیلوگرم','1401-7-26',95000),
(205,4001,'سییب زمینی',25,'کیلوگرم','1401-7-25',10000),
(206,4002,'هات داگ',100,'عدد','1401-7-27',7000),
(207,4002,'قارچ',15,'کیلوگرم','1401-7-29',21000),
(208,4002,'رشته',30,'بسته','1401-1-30',23000)


CREATE TABLE pokht(
	codeGhaza int NOT NULL,
	codeMavad int NOT NULL,
	zaman smallint DEFAULT 0,
	vahedZaman nvarchar(10),
	primary key (codeGhaza, codeMavad)
)
	
alter table pokht
add constraint pokht_fk_codeGhaza
foreign key (codeGhaza)references ghaza(codeGhaza)
insert into pokht values
(106,203,40,'دقیقه'),
(109,208,20,'دقیقه'),
(102,206,25,'دقیقه'),
(108,208,20,'دقیقه'),
(101,201,20,'دقیقه'),
(110,208,35,'دقیقه'),
(111,207,10,'دقیقه'),
(104,208,20,'دقیقه'),
(107,203,30,'دقیقه'),
(105,204,50,'دقیقه')


--فاکتور خرید 
select distinct ghaza.codeGhaza , onvanGhaza, gheymat,tedad,gheymat*tedad , zaman, vahedZaman
from ghaza,sefaresh,pokht
where ghaza.codeGhaza=sefaresh.codeGhaza
 and ghaza.codeGhaza=pokht.codeGhaza 

--ارزانترین ها
select distinct ghaza.codeGhaza , onvanGhaza, gheymat 
from ghaza,sefaresh
where ghaza.codeGhaza=sefaresh.codeGhaza
order by gheymat 



select onvan,gheymatMavad 
from mavadAvalie
where codeP=4001
--فروش کل
select  sum(gheymat*tedad)
from  sefaresh
 

-- view فاکتور خرید
CREATE VIEW view_factore AS
select distinct ghaza.codeGhaza , onvanGhaza, gheymat,tedad,gheymat*tedad gheymat_tedad, zaman, vahedZaman
from ghaza,sefaresh,pokht
where ghaza.codeGhaza=sefaresh.codeGhaza
 and ghaza.codeGhaza=pokht.codeGhaza;

 select * from view_factore;

-- view ارزانترین
CREATE VIEW view_cheapest AS
 select distinct ghaza.codeGhaza , onvanGhaza, gheymat 
from ghaza,sefaresh
where ghaza.codeGhaza=sefaresh.codeGhaza;

select * from view_cheapest;


-- پروسیجر ها و فانکشن

CREATE PROCEDURE spINSERT_moshtari @codeM int, @nam varchar(30), 
@famil varchar(30), @adres varchar(200)

AS

SET NOCOUNT ON

INSERT INTO moshtari
           ([codeM]
           ,[nam]
           ,[famil]
           ,[adres])
     VALUES
           (@codeM
           ,@nam
           ,@famil
           ,@adres)
GO

-- اجرا spINSERT_moshtari
EXECUTE spINSERT_moshtari
   @codeM = '21'
  ,@nam = 'صادق'
  ,@famil = 'زاهدی'
  ,@adres = 'بندرعباس-22بهمن'
GO

------
CREATE PROCEDURE spINSERT_personel @codeP int, @namP varchar(30), 
@familP varchar(30), @adresP varchar(200), @hoghoogh int

AS

SET NOCOUNT ON

INSERT INTO personel
           ([codeP]
           ,[namP]
           ,[familP]
           ,[adresP]
		   ,[hoghoogh])
     VALUES
           (@codeP
           ,@namP
           ,@familP
           ,@adresP
		   ,@hoghoogh)
GO

-- اجرا spINSERT_personel
EXECUTE spINSERT_personel
   @codeP = 5002
  ,@namP = 'علی'
  ,@familP = 'احمدی'
  ,@adresP = 'بندرعباس-22بهمن'
  ,@hoghoogh = 3000000
GO


-- دریافت حقوق پرسنل
CREATE FUNCTION f_get_hoghoogh_personel (
	@codeP int
)
RETURNS int AS
BEGIN
	DECLARE @return_value int;
    IF (@codeP is not null)
		BEGIN
			SET @return_value = (select hoghoogh from personel where codeP=@codeP);
		END
 
    RETURN @return_value
END;
-- اجرا کردن f_get_hoghoogh_personel
SELECT dbo.f_get_hoghoogh_personel(5002) AS hoghoogh 


-- ثبت تاریخ آپدیت اطلاعات پرسنل
Create Trigger trg_update_personel On personel
 After Update
 As Begin
 declare @codeP int;
 select @codeP=codeP from inserted;
Update personel Set updateDate = GETDATE()
Where codeP = @codeP
End

update personel set namP='صالح' where codeP=5002;

select * from personel  where codeP=5002;



