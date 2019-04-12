/*EX1*/
select musicgroup.genre, musicgroup.groupID
from musicgroup where musicgroup.genre like "Jazz";
/*EX2*/
select musician.name from musician, plays, instrument
where musician.ID=plays.ID and plays.numserie=instrument.numserie and instrument.name like "drums";
/*Ex3*/
select musician.name from musician, plays, instrument, musicgroup
where musicgroup.genre like "Jazz" and musician.ID=plays.ID and instrument.numserie=plays.numserie
and instrument.name like "saxophone";
/*EX4*/
select musicgroup.groupID from musicgroup, concerts
where concerts.Country like "Spain";
/*EX5*/
select disks.Referencenumber
	from disks, (select count(distinct has.name) as numsongs , disks.Referencenumber as numero
		from disks, has where disks.Referencenumber=has.Referencenumber group by has.Referencenumber) as Referencenumber
			where numsongs>10 and disk=numero;
select D.Referencenumber
	from disk as D 
		where (select count(distinct has.name) from disk as D1 natural join has where D1.Referencenumber=D.Referencenumber)>10;
/*EX6*/
select musicgroup.* from musicgroup, musician, members, 
	(select count(distinct members.ID) as numero, members.ID as dnis from members group by members.ID) as pp
where members.id=dnis and musicgroup.groupID=members.groupID and numero>3;
/*EX7*/
select opinions.opdescription 
	from opinions, buy, user, (select count(distinct buy.ID) as cantidad, buy.Id codigo from buy group by buy.Referencenumber) as pp
		where cantidad>3 and buy.ID=codigo and opinions.email=user.email and user.DNI=buy.ID;
/*EX8*/
!->select disk.title, disk.Referencenumber 
	from disk inner join has on disk.Referencenumber = has.disk.Referencenumber
where has.duration>5 and disk.format = "Physical" and disk.typeofphy = "CD";
/*EX9*/
select musician.name from musicgroup, perform, musician, concerts, members
where concerts.City like "Madrid" and perform.Code=concerts.Code and perform.groupID=musicgroup.groupID and
members.groupID=musicgroup.groupID and members.ID=musician.ID;
/*EX10*/
!->select opdescription 
	from aboutconcerts, musicgroup, perform, musician, concerts, members
where concerts.City like "Madrid" and perform.Code=concerts.Code and perform.groupID=musicgroup.groupID and
members.groupID=musicgroup.groupID and members.ID=musician.ID;
/*EX11*/
select song.*, musician.name from (((musician natural join composes) natural join song) natural join has) natural join disk
where disk.genre like "Heavy Metal" and disk.year=2018;
/*EX12*/
select musician.name from musician, plays, instrument, musicgroup, members
where musicgroup.genre like "Jazz" and musician.ID=members.ID and members.ID=musicgroup.groupID
and plays.ID=musician.ID and instrument.numserie=plays.numserie and instrument like "guitar";
/*EX13*/
!->select user.name, user.surname
	from user inner join buytickets on user.email = buytickets.email inner join tickets on tickets.ticketcode = buytickets.ticketcode
	natural join concerts inner join perform on perform.Code = concerts.code inner join groups on musicgroup.groupID = perform.groupID
where concerts.year = tickets.year = 2018 and concerts.month = tickets.month and concerts.day = ticekts.day and musicgroup.genre = "Jazz";
/*EX14*/
!->select disk.title, song.name 
	from disk inner join has on has.Referencenumber = disk.Referencenumber inner song on song.name = has.name inner join aboutdisks on disks.Referencenumber = disk.Referencenumber
where aboutdisks.rating>8;
/*EX15*/
select musicgroup.*, members.ID from musicgroup inner join members on members.groupID=musicgroup.groupID
where musicgroup.groupID 
	not in(select musicgroup.groupID 
		from musicgroup, perform, concerts where concerts.Code not in (select concerts.Code from concerts where concerts.Country like "Spain")
			and concerts.Code=perform.Code and musicgroup.groupID=perform.groupID)
	and musicgroup.groupID 
    in(select musicgroup.groupID from musicgroup, record, disk, (select count(has.name) as numsongs, disk.Referencenumber as disc 
													from has natural join disk group by has.Referencenumber) as pp
								where record.groupID=musicgroup.groupID 
									and record.Referencenumber=disk.Referencenumber and numsongs>10 and disc=disks.Referencenumber);
/*EX16*/
select song.name, musician.name from musician, song, musicgroup where musician.ID
not in(select members.ID from members, musicgroup, concerts, perform where concerts.Code 
not in(select concerts.Code from concerts where concerts.year=2017) and
concerts.Code=perform.Code and musicgroup.groupID=perform.groupID);
