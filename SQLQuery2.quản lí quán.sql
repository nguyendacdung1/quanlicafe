create database TheHighlandscofehous
go
use TheHighlandscofe
go
--đồ ăn(food)
--bàn(table)
--danh sách thực đơn(food category)
-- tài khoản(acccount)
--hóa đơn(bill)
--thông tin hóa đơn(bill info)

create table tablefood(
    id int identity primary key,
	name nvarchar(100) not null default N'chưa đặt tên',
	status nvarchar(100) default N'Trống' --Trống || Có người
)
go

create table account(
    userName nvarchar(100) primary key,
	displayName nvarchar(100) not null,
	passWord nvarchar(1000) not null,
	type int not null default 0 --1: admin || 0: staff
)
go

create table foodcategory(
     id int identity primary key,
	 name nvarchar(100) not null default N'Chưa có tên',
)
go
create table Food(
     id int identity primary key,
	 name nvarchar(100) not null default N'Chưa có tên',
	 idCategory int,
	 price float not null default 0

	 foreign key (idCategory) references foodcategory(id)
)
go
create table Bill(
      id int identity primary key,
	  dateCheckIn date not null default getdate(),
	  dateCheckOut date,
	  idTable int,
	  status int not null default 0 --1: đã thanh toán || 0: chưa thanh toán

	  foreign key (idTable) references tablefood(id)
)
go

create table BillInfo(
      id int identity primary key,
	  idBill int not null,
	  idFood int not null,
	  count int not null default 0

	  foreign key (idBill) references Bill(id),
	  foreign key (idFood) references Food(id)
)
go