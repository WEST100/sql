-- Таблица - customers

-- Вывести максимальный и минимальный credit_limit.

select max(CREDIT_LIMIT) as max_CREDIT_LIMIT, min(CREDIT_LIMIT) as min_CREDIT_LIMIT
from customers;

-- Вывести покупателей у которых creditlimit выше среднего creditlimit.

select CUST_FIRST_NAME
from customers
where credit_limit > (select avg(CREDIT_LIMIT) from customers);

-- Найти кол/во покупателей имя которых начинается на букву 'D' и credit_limit больше 500.

select CUST_FIRST_NAME
from customers
where (CUST_FIRST_NAME like 'D%') and (CREDIT_LIMIT > 500);

-- Таблица - order_items
-- Найти среднее значение unit_price

select avg(unit_price) as avg_unit_price
from order_items;

-- Таблицы - order_items, product_information
-- Вывести имена продуктов(PRODUCT_NAME), кол/во(QUANTITY) которых меньше среднего.

select
	t1.QUANTITY,
    t2.PRODUCT_NAME
from order_items t1
join product_information t2
on t1.PRODUCT_ID = t2.PRODUCT_ID
where t1.QUANTITY < (select avg(t1.QUANTITY) from order_items t1);

-- Таблицы - orders, customers
-- Вывести имя и фамилию покупателя с максимальной общей суммой покупки(ORDER_TOTAL).

select
	t1.cust_first_name,
    t1.cust_last_name,
    t2.ORDER_TOTAL
from customers t1
join orders t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
where t2.ORDER_TOTAL = (select max(t2.ORDER_TOTAL) from orders t2);

-- Найти сумму общей суммы покупок(ORDER_TOTAL) всех женатых мужчин покупателей.

select
    sum(ORDER_TOTAL) as sum_ORDER_TOTAL
from customers t1
join orders t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
where t1.MARITAL_STATUS = 'married';

