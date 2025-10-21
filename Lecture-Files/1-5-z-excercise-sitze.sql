
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
