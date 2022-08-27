--	Scripts de exercícios - dvdrental
--	1 - Listar todos os atores;
--	2 - Listar todos os atores com o primeiro nome igual a Christian;
--	3 - Listar apenas o nome e sobrenome dos atores com a inicial D;
--	4 - Listar os 10 primeiros atores;
--  Executar o script acima para todas as tabelas do database. 
-- (Atenção aos itens 2 e 3, listem de forma coerente com cada tabela!)


---------------------
-- Ator

select * from actor;

select * from actor where first_name='Christian';

select first_name, last_name from actor where last_name like 'D%';

select * from actor limit 10;

---------------------
-- Endereço

select * from address;

-----

select * from address where district ='Rio Grande do Sul';

-----

select address, postal_code from address a  where address  like '%Place';

-----

select * from address a  limit 10;

---------------------
-- Cliente

select * from customer;

-----

select * from customer  where first_name ='Maria';

-----

select first_name, last_name from customer  where first_name  like 'L%';

-----

select * from customer  limit 10;

---------------------
-- Filme

select * from film;

-----

select * from film  where title ='Horror Reign';

-----

select title, description  from film  where title  like 'L%';

-----

select * from film limit 10;

---------------------
-- Filme e ator

select * from 
	film_actor fa 
inner join
	actor a
on
	fa.actor_id = a.actor_id
inner join
	film f
on
	fa.film_id = f.film_id;

-----

select 
	a.first_name, f.title 
from 
	film_actor fa 
inner join
	actor a
on
	fa.actor_id = a.actor_id
inner join
	film f
on
	fa.film_id = f.film_id
where
	f.title like 'A%';

-----

select 
	a.first_name, f.title 
from 
	film_actor fa 
inner join
	actor a
on
	fa.actor_id = a.actor_id
inner join
	film f
on
	fa.film_id = f.film_id
limit 10;

---------------------
-- Categoria

select * from 
	category c  
inner join
	film_category fc
on
	c.category_id = fc.category_id
inner join
	film f
on
	fc.film_id = f.film_id;

-----

select * from 
	category c  
inner join
	film_category fc
on
	c.category_id = fc.category_id
inner join
	film f
on
	fc.film_id = f.film_id
where
	f.title ='Chamber Italian';

-----

select 
	c."name", f.title
from 
	category c  
inner join
	film_category fc
on
	c.category_id = fc.category_id
inner join
	film f
on
	fc.film_id = f.film_id
where
	f.title  like 'A%';

-----

select 
	c."name", f.title
from 
	category c  
inner join
	film_category fc
on
	c.category_id = fc.category_id
inner join
	film f
on
	fc.film_id = f.film_id
limit 10;

---------------------
-- Cidade

select * from 
	city c  
inner join
	country c2
on
	c.country_id  = c2.country_id;

-----

select * from 
	city c  
inner join
	country c2
on
	c.country_id  = c2.country_id
where
	c2.country  = 'Spain';

-----

select
	c.city, c2.country
from 
	city c  
inner join
	country c2
on
	c.country_id  = c2.country_id
where
	c2.country  like 'Sri%'
group by 
	c.city, c2.country;

-----

select * from 
	city c  
inner join
	country c2
on
	c.country_id  = c2.country_id
limit 10;

---------------------
-- País

select * from 
	country c  
inner join
	city c2
on
	c.country_id  = c2.country_id;

-----

select * from 
	country c  
inner join
	city c2
on
	c.country_id  = c2.country_id
where
	c.country  = 'Spain';

-----

select 
	c.country, c2.city
from 
	country c  
inner join
	city c2
on
	c.country_id = c2.country_id 
where
	c.country like 'Sri%'
group by 
	c.country, c2.city;

-----

select * from 
	city c  
inner join
	country c2
on
	c.country_id  = c2.country_id
limit 10;


---------------------
-- Filme e Categoria

select * from 
	film_category fc  
inner join
	category c
on
	fc.category_id = c.category_id 
inner join 
	film f 
on
	fc.film_id = f.film_id;

-----

select * from 
	film_category fc  
inner join
	category c
on
	fc.category_id = c.category_id 
inner join 
	film f 
on
	fc.film_id = f.film_id
where
	f.title  = 'Airport Pollock';

-----

select 
	c."name" , f.title
from 
	film_category fc  
inner join
	category c
on
	fc.category_id = c.category_id 
inner join 
	film f 
on
	fc.film_id = f.film_id
where
	f.title  = 'Airport Pollock'
group by 
	c."name" , f.title;

-----

select 
	c."name" , f.title
from 
	film_category fc  
inner join
	category c
on
	fc.category_id = c.category_id 
inner join 
	film f 
on
	fc.film_id = f.film_id
limit 10;

---------------------
-- Inventario

select * from 
	inventory i   
inner join
	film f
on
	i.film_id  = f.film_id  
inner join 
	store s 
on
	i.store_id  = s.store_id;

-----

select * from 
	inventory i   
inner join
	film f
on
	i.film_id  = f.film_id  
inner join 
	store s 
on
	i.store_id  = s.store_id
where 
	f.title = 'Antitrust Tomatoes';

-----

select 
	f.title, f.description
from 
	inventory i   
inner join
	film f
on
	i.film_id  = f.film_id  
inner join 
	store s 
on
	i.store_id  = s.store_id
where 
	f.title like 'B%'
group by 
	f.title, f.description;

-----

select 
	f.title, f.description
from 
	inventory i   
inner join
	film f
on
	i.film_id  = f.film_id  
inner join 
	store s 
on
	i.store_id  = s.store_id
where 
	f.title like 'B%'
group by 
	f.title, f.description
limit 10;


---------------------
-- Idioma

select * from 
	"language" l  
inner join
	film f
on
	l.language_id = f.language_id;

-----

select * from 
	"language" l  
inner join
	film f
on
	l.language_id = f.language_id
where 
	l."name" = 'English             ';

-----

select
	l.name, f.title
from 
	"language" l  
inner join
	film f
on
	l.language_id = f.language_id
where 
	l."name" like 'E%'
group by 
	l.name, f.title;

-----

select
	l.name, f.title
from 
	"language" l  
inner join
	film f
on
	l.language_id = f.language_id
where 
	l."name" like 'E%'
group by 
	l.name, f.title
limit 10;


---------------------
-- Forma de pagamento

select * from 
	payment p  
inner join
	staff s 
on
	p.staff_id  = s.staff_id;

-----

select * from 
	payment p  
inner join
	staff s 
on
	p.staff_id  = s.staff_id
where 
	s.first_name = 'Jon';

-----

select 
	s.first_name , s.last_name
from 
	payment p  
inner join
	staff s 
on
	p.staff_id  = s.store_id
where 
	s.last_name  like '%i%'
group by 
	s.first_name , s.last_name;

-----

select 
	s.first_name , s.last_name
from 
	payment p  
inner join
	staff s 
on
	p.staff_id  = s.staff_id
group by 
	s.first_name , s.last_name
limit 1;


---------------------
-- Aluguel

select * from 
	rental r   
inner join
	customer c  
on
	r.customer_id  = c.customer_id;

-----

select * from 
	rental r   
inner join
	customer c  
on
	r.customer_id  = c.customer_id
where 
	c.first_name = 'Jon';

-----

select 
	c.first_name , c.last_name 
from 
	rental r   
inner join
	customer c  
on
	r.customer_id  = c.customer_id
where 
	c.last_name like 'J%'
group by 
	c.first_name , c.last_name;

-----

select 
	c.first_name , c.last_name 
from 
	rental r   
inner join
	customer c  
on
	r.customer_id  = c.customer_id
where 
	c.last_name like 'J%'
group by 
	c.first_name , c.last_name
limit 10;



---------------------
-- Aluguel

select * from 
	rental r   
inner join
	customer c  
on
	r.customer_id  = c.customer_id;

-----

select * from 
	rental r   
inner join
	customer c  
on
	r.customer_id  = c.customer_id
where 
	c.first_name = 'Jon';

-----

select 
	c.first_name , c.last_name 
from 
	rental r   
inner join
	customer c  
on
	r.customer_id  = c.customer_id
where 
	c.last_name like 'J%'
group by 
	c.first_name , c.last_name;

-----

select 
	c.first_name , c.last_name 
from 
	rental r   
inner join
	customer c  
on
	r.customer_id  = c.customer_id
where 
	c.last_name like 'J%'
group by 
	c.first_name , c.last_name
limit 10;


---------------------
-- Funcionários

select * from 
	staff s    


-----

select * from 
	staff s   
where 
	s.first_name = 'Mike';

-----

select 
	s.first_name , s.last_name
from 
	staff s   
where 
	s.first_name like 'M%'
group by 
	s.first_name , s.last_name;

-----

select 
	s.first_name , s.last_name
from 
	staff s   
group by 
	s.first_name , s.last_name
limit 1;


---------------------
-- Armazenar

select * from 
	store s    
inner join
	staff s2 
on
	s.manager_staff_id = s2.staff_id;
	
-----

select * from 
	store s    
inner join
	staff s2 
on
	s.manager_staff_id = s2.staff_id  
where 
	s2.first_name = 'Mike';

-----

select 
	s2.first_name , s2.last_name
from 
	store s    
inner join
	staff s2 
on
	s.manager_staff_id = s2.staff_id  
group by 
	s2.first_name , s2.last_name;

-----

select 
	s2.first_name , s2.last_name
from 
	store s    
inner join
	staff s2 
on
	s.manager_staff_id = s2.staff_id  
group by 
	s2.first_name , s2.last_name
limit 1;



