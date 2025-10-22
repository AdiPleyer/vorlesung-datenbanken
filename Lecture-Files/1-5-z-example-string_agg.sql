--- string_agg works only in PostgreSQL

select rating, avg(rating), string_agg(name,' - ') 
    from hotels 
    group by rating;
    

    