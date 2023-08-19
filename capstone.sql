use sakila;
select * from actor;
														/* Task-1*/
                                  
select concat(first_name,' ',last_name) as full_name from actor;

                                                         /* Task-2.1*/
                                  
select first_name,count(first_name) as count from actor group by first_name order by count(first_name) desc;

                                                         /*Task-2.2*/
                                  
select count(distinct(first_name))as count from actor;                                
select distinct(first_name) from actor;

                                                          /*Task-3.1*/
                                  
select last_name,count(last_name) as count from actor group by last_name order by count(last_name) desc;

														  /*Task-3.2*/
select distinct(last_name) from actor;

														  /*Task-4.1*/
                                                            
select * from film where rating='R';

                                                          /*Task-4.2*/
                                                          
select * from film where not rating='R';

                                                         /*Task-4.3*/
                                                         
select * from film where rating='pg-13';

                                                        /*Task-5.1*/
                                                        
select * from film where replacement_cost<=11;

                                                        /*Task-5.2*/
                                                        
select * from film where replacement_cost between 11 and 20;

														/*Task-5.3*/
select * from film order by replacement_cost desc;

                                                        /*Task-6*/
                                                        
select * from film_actor;
select * from film;
select title,(select count(actor_id)  from film_actor where film.film_id=film_actor.film_id) as count_actor from film  order by count_actor desc limit 3;

								
                                                      /*Task-7*/
                                                      
select title from film where title like 'k%' or title like 'q%';

                                                      /*Task-8*/
select * from actor;
select * from film_actor;
select * from film ;
select concat(first_name,' ',last_name) as full_name from actor where actor_id in (select actor_id from film_actor where film_id=(select film_id from film where title='Agent Truman'));


                                                        /*Task-9*/
select * from film; 
select * from film_category;
select * from category;
select title  from film where film_id in (select film_id from film_category where category_id=(select category_id from category where name='Family'));


                                                        /*Task-10.1*/
                                                        
select * from film_category;
select rating,min(rental_rate) as minimum,max(rental_rate) as maximum,avg(rental_rate) as average from film  group by rating order by avg(rental_rate) desc;
     
                                                        /*Task=10.2*/
                                                        
select title,rental_duration from film order by rental_duration desc;

                                                        /*Task-11*/
                                                        
select * from film; 
select * from film_category;
select * from category;                                   
 create view film_cat as select film.film_id,film.rental_rate,film.replacement_cost,film_category.category_id,category.name from film right outer join film_category on film.film_id=film_category.film_id right outer join category on film_category.category_id=category.category_id; 
 select * from film_cat;
 select name, avg(replacement_cost) as avg_repalcement_cost,avg(rental_rate) as avg_rental_rate,avg(replacement_cost)-avg(rental_rate) as average from film_cat group by name  having avg(replacement_cost)-avg(rental_rate)>15  ;

 

									                     /*Task-12*/
                                                         
select * from film; 
select * from film_category;
select * from category;
create view cat_name as select film_category.category_id,film_category.film_id, category.name from film_category left outer join category on film_category.category_id=category.category_id; 
select * from cat_name;
select name,count(film_id) as count from cat_name  group by name  having count(film_id)>70;

 