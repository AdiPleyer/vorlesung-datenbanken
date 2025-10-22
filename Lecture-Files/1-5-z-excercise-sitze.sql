
--- 3d

select block, avg(sitzpreis) as dp 
    from sitz 
    join preis using(raumnr, preiskat)
    where raumnr = '01'
    group by block
    order by dp desc;

--- 3e

select * 
    from sitz s1, sitz s2;
    where 
        s1.raumnr = s2.raumnr
        and s1.block = s2.block
        and s1.reihe = s2.reihe
        and s1.belegung = false
        and s2.belegung = false
        and s1.sitznr = s2.sitznr - 1;

--- 3e erweitert um die Frage nach dem Gesamtpreis für beide Sitze

select * from (
    select s1.raumnr as derraum, *, p1.sitzpreis + p2.sitzpreis as zielpreis
        from sitz as s1
        join sitz as s2 using(raumnr, block, reihe)
        join preis as p1 on s1.raumnr = p1.raumnr and s1.preiskat = p1.preiskat
        join preis as p2 on s2.raumnr = p2.raumnr and s2.preiskat = p2.preiskat
        where s1.belegung = false
            and s2.belegung = false
            and s1.sitznr = s2.sitznr - 1
    ) as foo 
    where derraum = '01'
        and zielpreis <= 50;

--- more on rooms and prices

--- Block mit dem maximalen durchschnittlichen Sitzpreis im Raum '01' ---

select block, avg(SitzPreis)
		from SITZ join Preis using (RaumNr, PreisKat) 
		where RaumNr = '01'
		group by Block
		having avg(SitzPreis) >= (
			select max(durchschnitt) from (
					select block, avg(SitzPreis) as durchschnitt
						from SITZ join Preis using (RaumNr, PreisKat) 
						where RaumNr = '01'
						group by Block))
						;


--- random free seat in room '01' with price category <= 5 - is this correct ???
select * from SITZ, (select round(random()*4)+1 as r1, round(random()*4)+1 as r2) as r
	where RaumNr = '01' and Belegung = false and PreisKat <= 5 and reihe = r.r1 and sitznr = r.r2;
select * from SITZ
	where RaumNr = '01' and Belegung = false and PreisKat <= 5 
		and reihe in (select round(random()*4)+1) 
		and sitznr in (select round(random()*4)+1);

-- random number between 1 and 4 on PostgreSQL
select round(random()*4)+1;
--- random number between 1 and 4 on SQLite
select abs(random()) % 4 + 1

--- average seat price per block and room
select raumnr, block, avg(sitzpreis) as asp
	from sitz join preis using (raumnr, preiskat) 
	group by raumnr, block order by avg(sitzpreis) desc
	

--- block with the highest average seat price
select * from (
	select raumnr, block, avg(sitzpreis) as asp
		from sitz join preis using (raumnr, preiskat) 
		group by raumnr, block
		) foo1
	where asp in (select max(asp) from (
        select raumnr, block, avg(sitzpreis) as asp
            from sitz join preis using (raumnr, preiskat) 
            group by raumnr, block
            ) foo2
        )
		
--- find two adjacent free seats in room '01'
select block, sitznr, (sitznr + 1) as zweitersitz, reihe from sitz s1
  where belegung = false
      and raumnr = '01'
      and sitznr + 1 in
            (select sitznr from sitz s2
                where belegung = false
                and s1.block = s2.block
                and s1.reihe = s2.reihe
                and raumnr = '01');

--- find two adjacent free seats in room '01' using JOIN
select s1.sitznr, s2.sitznr, s1.block, s1.reihe, s1.raumnr
    from sitz as s1
    join sitz as s2 using (block,raumnr,reihe)
    where s1.belegung = false
        and s2.belegung = false
        and s1.sitznr = s2.sitznr + 1
        and s1.raumnr = '01';









select *, sitznr + 1 from sitz 
     where belegung = false and sitznr + 1 in (select sitznr from sitz where belegung = false);


select * from sitz as s1, sitz as s2
     where s1.raumnr = s2.raumnr
     and s1.block = s2.block
     and s1.reihe = s2.reihe
     and s1.sitznr +1 = s2.sitznr
     and s1.belegung = false and s2.belegung = false;


select * from sitz as s1 join sitz as s2 using(raumnr, block, reihe)
     where s1.sitznr +1 = s2.sitznr
     and s1.belegung = false and s2.belegung = false;


select * from sitz as s1 join sitz as s2 using(raumnr, block, reihe)
     where s1.sitznr +1 = s2.sitznr
     and s1.belegung = false and s2.belegung = false
     and block = 'A'
     and s1.preiskat <= '2'
     and s2.preiskat <= '2';
