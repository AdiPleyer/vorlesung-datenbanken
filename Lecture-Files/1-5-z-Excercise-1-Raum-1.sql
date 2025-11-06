--- Raum a:

select count(*) from sitz 
    where raumnr = '01' and belegung = false;

--- Raum b:
select count(*) from sitz 
    where raumnr = '01' and belegung;


--- Raum c:
select * 
    from sitz
    where preiskat <= '5'
    and block = 'D'
    and belegung = false;

--- Raum d: 

--- Vorübung:
--- two equivalent queries using different join syntaxes
--- Durchschittspreise pro Raum und Block

select s.raumnr, s.block, avg(p.sitzpreis)
    from sitz as s
    join preis as p on s.preiskat = p.preiskat and s.raumnr = p.raumnr
    group by s.raumnr, s.block;

select s.raumnr, s.block, avg(p.sitzpreis)
    from sitz as s
    join preis as p using(preiskat, raumnr)
    group by s.raumnr, s.block;

--- halbwegs akzeptable Teillösung
--- alle Durchschnittspreise für Raum '01' absteigend sortiert

select s.raumnr, s.block, avg(p.sitzpreis)
    from sitz as s
    join preis as p using(preiskat, raumnr)
    where s.raumnr = '01'
    group by s.raumnr, s.block
    order by avg(p.sitzpreis) desc;

--- finale Lösung mit CTE
with roomaverages as (
    select s.raumnr, s.block, avg(p.sitzpreis) as avgpreis
        from sitz as s
        join preis as p using(preiskat, raumnr)
        group by s.raumnr, s.block)
select * 
    from roomaverages ra
    where raumnr = '01'
    and avgpreis = (select max(avgpreis) from roomaverages where raumnr = '01');

--- more compact finale Lösung mit CTE
with roomaverages as (
    select s.raumnr, s.block, avg(p.sitzpreis) as avgpreis
        from sitz as s
        join preis as p using(preiskat, raumnr)
        where raumnr = '01'
        group by s.raumnr, s.block
)
select * 
    from roomaverages ra
        where avgpreis = (select max(avgpreis) from roomaverages);


--- finale Lösung ohne CTE, dafür mit etwas redundanz

select * 
    from (select s.raumnr, s.block, avg(p.sitzpreis) as avgpreis
        from sitz as s
        join preis as p using(preiskat, raumnr)
        where raumnr = '01'
        group by s.raumnr, s.block) ra1
    where avgpreis = (select max(avgpreis) 
                        from (select s.raumnr, s.block, avg(p.sitzpreis) as avgpreis
                                from sitz as s
                                join preis as p using(preiskat, raumnr)
                                where raumnr = '01'
                                group by s.raumnr, s.block) ra2
                        );

--- Raum e:

--- 3e

select * 
    from sitz s1, sitz s2
    where 
        s1.raumnr = s2.raumnr
        and s1.block = s2.block
        and s1.reihe = s2.reihe
        and s1.belegung = false
        and s2.belegung = false
        and s1.sitznr = s2.sitznr - 1;

select * 
    from sitz as s1
    join sitz as s2 using(raumnr, block, reihe)
    where 
        s1.belegung = false
        and s2.belegung = false
        and s1.sitznr = s2.sitznr - 1;

--- Raum 3f: 3e erweitert um die Frage nach Raum und maximaler Preiskategorie
select s1.raumnr as derraum, s1.reihe, s1.sitznr, s2.sitznr, s1.preiskat, s2.preiskat  
    from sitz as s1
    join sitz as s2 using(raumnr, block, reihe)
    where s1.belegung = false
        and s2.belegung = false
        and s1.sitznr = s2.sitznr - 1
        and s1.raumnr = '01'
        and s1.preiskat <= '3'
        and s2.preiskat <= '3';


--- Raum 3f+: 3f erweitert um die Frage nach dem maximalem Gesamtpreis für beide Sitze

select * from (
    select s1.raumnr as derraum, s1.reihe, s1.sitznr, s2.sitznr, p1.sitzpreis + p2.sitzpreis as zielpreis
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


