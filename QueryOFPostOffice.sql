use Post_Office_System;

Create table DimSender(
					   senderID int primary key  identity,
					   senderName varchar(20),
					   senderGender varchar(10),
					   senderTelephone varchar(10),
					   senderLandmark varchar(30),
					   senderCity varchar(30),
					   senderState varchar(20),
					   senderCountry varchar(20),
					   senderZipcode bigint
					  )
select * from DimSender
Create table DimReceiver(
						receiverID int primary key identity,
						receiverName varchar(30),
					
						receiverTelephone varchar(10),
						receiverLandmark varchar(30),
						receiverCity varchar(20),
						receiverState varchar(20),
						receiverCountry varchar(20),
						receiverZipcode bigint
						)
drop table DimSender
select * from [dbo].[DimReceiver]
create table DimDeliveryManDetails(
								  deliverManID int primary key identity,
								  deliverManName varchar(20),
								  deliverManGender varchar(10),
								  deliverManMobNo varchar(10),

								  )

drop table DimDeliveryManDetails

create table dimParcelDetails( 
							  parcelID int primary key identity ,
							  parcelName varchar(30),
							  parcelCategory varchar(30)

							 )


create table DimPaymentDetails(
								paymentID int primary Key identity,
								paymentMethod varchar(10)
						      )


Create table Post_Office_details(
								post_office_id int primary key identity,
								post_office_location varchar(50),
								post_office_emp int,
								post_office_number varchar(10),
								post_office_email varchar(50)
								)
	Drop table Post_Office_details
select * from [dbo].[DimPaymentDetails];
create table FactPostPffice(
					  parcelOrderID int primary key identity,
					  post_office_id int not null,
					  dateKey int not null,
					  senderID int not null ,
					  receiverID int not null,
					  deliverManID int not null,
					  parcelID int not null,
					  paymentID int not null,
					  distanceInKM int not null,
					  Quantities int ,
					  totalCost money
					 )
					 go
select * from [dbo].[FactPostPffice]
drop table [dbo].[FactPostPffice];


Create table DimDate(
							dateKey int identity primary key,
							 sendDate date,
							 receiveDate date,
							 sendYearNumber int ,
							 receiveYearNumber int ,
							 sendMonthNumber int,
							 receiveMonthNumber int,
							 SendDayOFMonth int,
							 ReceiveDayOfMonth int,
							 Quarter int
						  )
drop table DimDate



AlTER TABLE FactPostPffice ADD CONSTRAINT
FK_SenderID FOREIGN KEY (senderID)REFERENCES DimSender(senderID);
AlTER TABLE FactPostPffice ADD CONSTRAINT
FK_ReceiverID FOREIGN KEY (receiverID)REFERENCES DimReceiver(receiverID);
AlTER TABLE FactPostPffice ADD CONSTRAINT
FK_DeliverManID FOREIGN KEY (deliverManID)REFERENCES DimDeliveryManDetails(deliverManID);
AlTER TABLE FactPostPffice ADD CONSTRAINT
FK_ParcelID FOREIGN KEY (parcelID)REFERENCES DimParcelDetails(parcelID);
AlTER TABLE FactPostPffice ADD CONSTRAINT
FK_PaymentID FOREIGN KEY (paymentID)REFERENCES DimPaymentDetails(paymentID);
AlTER TABLE FactPostPffice ADD CONSTRAINT
FK_DateKey FOREIGN KEY (dateKey)REFERENCES DimDate(dateKey);

AlTER TABLE FactPostPffice ADD CONSTRAINT
FK_Post_office foreign key(post_office_id) REFERENCES Post_Office_details(post_office_id);

select * from[dbo].[FactPostPffice]
