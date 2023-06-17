-- 1) Get all pairs of actors that worked together.
select a1.actor_id,a2.actor_id, a1.film_id from film_actor a1
inner join film_actor a2 on a1.film_id=a2.film_id
and a1.actor_id != a2.actor_id
where a1.actor_id < a2.actor_id;

-- 2) Get all pairs of customers that have rented the same film more than 3 times.

select r1.customer_id, r2.customer_id, r1.film_id
from (
	select r.customer_id, i.film_id 
    from rental r
    left join inventory i on r.inventory_id = i.inventory_id
    order by r.customer_id, i.film_id
    ) as r1
inner join (
	select r.customer_id, i.film_id 
    from rental r
    left join inventory i on r.inventory_id = i.inventory_id
    order by r.customer_id, i.film_id
    ) as r2 on r1.film_id = r2.film_id
where  r1.customer_id < r2.customer_id
group by r1.customer_id, r2.customer_id, r1.film_id
having count(*)>3;

-- 3) Get all possible pairs of actors and films.
select a1.actor_id, a1.film_id from film_actor a1
cross join film_actor a2;





