-- 1. Посчитать количество рейсов по каждой модели самолета. Вывести modelname и flightcount.

select model_name, count(*) as flightcount
from airliners
group by model_name;

-- 2. Вычислить среднюю стоимость билета по классам обслуживания. Вывести serviceclass и averageprice

select service_class, avg(price) as averageprice
from tickets
group by service_class;

-- 3. Определить средний возраст клиентов, сгруппированных по классу обслуживания. 
-- Вывести serviceclass и averageage.

select t1.service_class, avg(t2.age) as averageage
from tickets t1
inner join clients t2
on t1.client_id = t2.id
group by t1.service_class;

-- 4.Получить общее количество билетов, купленных каждым клиентом. Вывести name и ticket_count.

select t1.name, count(*) as ticket_count
from clients t1
inner join tickets t2
on t1.id = t2.client_id
group by t1.name;

-- 5.Определить количество рейсов, отправленных из каждого аэропорта. 
-- Вывести departure и departure_count.

select departure, count(departure) as departure_count
from trips
group by departure;

-- 6. Вычислить общий доход от продажи билетов для каждой страны производителя самолетов. 
-- Вывести country и total_sum.

select t1.country, sum(t3.price) as total_sum
from airliners t1
inner join trips t2
on t1.id = t2.airliner_id
inner join tickets t3
on t2.id = t3.trip_id
group by t1.country;



