SELECT pizzeria.name, count(*) as count_of_orders, round(AVG(menu.price)) as average_price,
	   max(menu.price) as max_price, min(menu.price) as min_price from person_order
join pizzeria on pizzeria.id = person_order.person_id
join menu on menu.id = person_order.menu_id
group by pizzeria.name
order by pizzeria.name;