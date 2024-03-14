-- Вывести имя, фамилию пользователей и даты их заказов(order_date).

select
t1.cust_first_name, 
 t1.cust_last_name, 
 t2.order_date 
 from customers t1
join orders t2
on t1.customer_id = t2.customer_id;

-- Вывести даты заказов продуктов и описание этих продуктов(product_description).

select
t1.order_date,
t3.PRODUCT_DESCRIPTION
from orders t1
join order_items t2
on t1.order_id = t2.order_id
join product_information t3
on t2.PRODUCT_ID = t3.PRODUCT_ID;

-- Вывести имя, фамилию пользователей, даты заказов(orderdate), описание продуктов,
-- которые они заказали и категории соответствующих продуктов (categoryname).

-- не работает, не пойму почему
select
t1.order_date,
t3.PRODUCT_DESCRIPTION,
t3.category_name
from orders t1
join order_items t2
on t1.order_id = t2.order_id
join product_information t3
on t2.PRODUCT_ID = t3.PRODUCT_ID;

-- Вывести названия(productname), описания категорий(categorydescription) и
-- количества(quantity) тех продуктов, у которых минимальная стоимость (min_price) больше 300.

select
t1.product_name,
t2.category_description,
t3.quantity
from product_information t1
join categories_tab t2
on t1.CATEGORY_ID = t2.CATEGORY_ID
join order_items t3
on t1.PRODUCT_ID = t3.PRODUCT_ID
where t1.min_price > 300;

-- Вывести имя, фамилию покупателей, которые купили принтеры.
-- сложно. тут надо соединить 5 таблиц и отсортировать есть ли в описании слово принтер
-- не сделал

-- Вывести имя, фамилию всех женатых мужчин покупателей, которые покупали продукты
-- со стоимостью (list_price) больше 550.
-- все я сдался

-- Вывести названия(product_name) тех продуктов, у которых стоимость больше,
-- чем у продукта 'LaserPro 600/6/BW’.

select product_name
from product_information
where LIST_PRICE > 498;