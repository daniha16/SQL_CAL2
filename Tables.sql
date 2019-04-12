drop table if exists record;
drop table if exists plays;
drop table if exists gives;
drop table if exists aboutdisks;
drop table if exists aboutconcerts;
drop table if exists opinions;
drop table if exists members;
drop table if exists buytickets;
drop table if exists buydisks;
drop table if exists perform;
drop table if exists musicgroup;
drop table if exists song;
drop table if exists instrument;
drop table if exists has;
drop table if exists composes;
drop table if exists concerts;
drop table if exists musician;
drop table if exists tickets;
drop table if exists customer;
drop table if exists Disks;

create table musician
(	name varchar(10),
	surname	varchar(10),
    address varchar(10),
    zipcode numeric(6,0),
    phone numeric(9,0) ,
    city	varchar(10),
    province varchar(10),
    ID char(9),
    primary key (ID)
);
create table instrument
( name varchar(10),
  numserie numeric(10,0),
  primary key (numserie)
);
create table song
(	duration int,
	year numeric(4,0),
    day numeric(2,0),
    month numeric(2,0),
	name varchar(10),
    ID char(9),
    primary key (ID),
    foreign key (ID) references musician (ID)
);
create table musicgroup
(	genre varchar(10),
	groupID varchar(9),
    primary key (groupID)
);
create table concerts
(	venue	varchar(10),
	City	varchar(10),
    Country	varchar(10),
	year numeric(4,0),
    month numeric(4,0),
    day	  numeric(2,0),
    Code	char(9),
    primary key (Code)
);
create table Disks
(	Referencenumber numeric(9,0),
	format		varchar(10),
	title	varchar(10),
    year numeric(4,0),
    month numeric(4,0),
    day	  numeric(2,0),
    genre varchar(10),
    primary key (Referencenumber)
);

create table customer
(	name varchar(10),
	email varchar(10),
    points int,
    surname varchar(10),
    DNI		char(9),
	primary key (email)
);
create table tickets
(	ticketcode	numeric(9,0),
	year numeric(4,0),
    month numeric(4,0),
    day	  numeric(2,0),
    price int,
    primary key (ticketcode)
);
create table opinions
(	opdescription varchar(500),
	email varchar(10),
    primary key (email, opdescription),
    foreign key (email) references customer(email)
);
create table plays
(	ID	char(9),
	numserie numeric(10,0),
    primary Key (ID, numserie),
    foreign key (ID) references musician(ID),
    foreign key (numserie) references instrument(numserie)
);
create table composes
(	ID varchar(9),
	duration int,
	name varchar(10),
    primary key(ID),
    foreign key(ID) references musician(ID)
);
create table has
(	Referencenumber numeric(9,0),
	duration		int,
    year numeric(4,0),
    day numeric(2,0),
    month numeric(2,0),
	name varchar(10),
    ID	char(9),
    primary Key(Referencenumber, ID), 
    foreign Key(Referencenumber) references Disks(Referencenumber),
    foreign Key(ID) references musician(ID)
    );
create table members
(	ID	char(9),
	groupID varchar(9),
    primary key(ID, groupID),
    foreign key(ID) references musician(ID),
    foreign key(groupID) references musicgroup(groupID)
    );
create table perform 
(	groupID		char(9),
	Code	char(9),
    primary Key(groupID, Code),
    foreign key(groupID) references musicgroup(groupID),
    foreign key(Code) references concerts(Code)
    );
create table record
(	groupID	varchar(9),
	Referencenumber numeric(9,0),
    primary key(groupID, Referencenumber),
    foreign key(groupID) references musicgroup(groupID),
    foreign key(Referencenumber) references disks(Referencenumber)
    );
create table buytickets
(	ticketcode	numeric(9,0),
	email varchar(10),
	primary key(ticketcode, email),
    foreign key(ticketcode) references tickets(ticketcode),
    foreign key(email) references customer(email)
);
create table buydisks
(
	Referencenumber	 numeric(9,0),
	email varchar(10),
	primary key(Referencenumber, email),
    foreign key(Referencenumber) references Disks(Referencenumber),
    foreign key(email) references customer(email)
);
create table aboutdisks
(
	Referencenumber numeric(9,0),
	opdescription	varchar(500),
    email	varchar(10),
	primary key(Referencenumber, email),
    foreign key(Referencenumber) references Disks(Referencenumber),
    foreign key(email) references opinions(email)
);
create table aboutconcerts
(
	Code	char(9),
	opdescription	varchar(500),
	email varchar(10),
	primary key(Code, email),
    foreign key(Code) references concerts(Code),
    foreign key(email) references opinions(email)
);



        