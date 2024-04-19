-- 1. Найти общую сумму заказов для каждого клиента.

select t1.cname, sum(t2.amt) as sum_amt
from customers t1
inner join orders t2
on t1.cust_id = t2.CUST_ID
group by t1.cname;

-- 2.Получить количество заказов для каждого продавца.

select t1.sname, count(t2.order_id) as count_order
from sellers t1
inner join orders t2
on t1.sell_id = t2.sell_id
group by t1.sname;

-- 3. Получить количество клиентов с рейтингом выше среднего.

-- не работает, не пойму где ошибся
select count(cust_id) as count_clients
from customers
where RATING > avg(RATING);

-- 4. Получить количество клиентов в каждом городе с рейтингом выше 200.

select count(cust_id) as count_clients, city
from customers
where RATING > 200
group by city;

-- 5. Получить количество заказов, сделанных в каждый месяц.

select count(order_id) as count_orders, month(odate)
from orders
group by odate;

-- 6.Найти клиентов, у которых сумма заказов превышает среднюю сумму заказов всех клиентов.

-- не работает не пойму где ошибка
select t1.cname
from customers t1
inner join orders t2
on t1.CUST_ID = t2.CUST_ID
where sum(t2.amt) > avg(sum(t2.amt));


