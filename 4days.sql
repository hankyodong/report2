-- create database petdatabase;
-- use petdatabase;

create table petowners(
ownerid int auto_increment primary key,
name varchar(30) not null,
contact varchar(255)
);
-- 고객이 여러 반려동물을 가질 수 있다.
create table pets (
petid int auto_increment primary key,
ownerid int not null,
name varchar(100) not null,
species varchar(50),
foreign key(ownerid) references petowners(ownerid)
);
create table rooms(
roomid int auto_increment primary key,
roomnumber varchar(50) not null unique,
pricepernight decimal(10,2) not null
);

-- 한 반려동물은 여러 번 예약할 수 있다.
-- 예약은 객실과 연결되어야 한다.

create table reservations( 
reservationid int auto_increment primary key,
petid int not null,
roomid int not null,
startdate date not null,
enddate date not null,
foreign key (petid) references pets(petid),
foreign key (roomid) references rooms(roomid)
);
-- 예약 시 다양한 서비스도 함께 예약할 수 있다.
create table services(
serviceid int auto_increment primary key,
reservationid int not null,
servicename varchar(100),
serviceprice decimal(10,2),
foreign key(reservationid) references reservations(reservationid)
);

