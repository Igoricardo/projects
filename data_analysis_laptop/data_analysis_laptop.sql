-- Databricks notebook source
-- Visualização dos 100 primeiros registros no dataset

select *
from cleaned_laptop_data_csv
limit 100;

-- COMMAND ----------

-- A base de dados é de origem indiana, então os campos que representam os valores dos laptops estão na moeda local, no caso em Rúpias
-- Nesta parte estamos convertendo os valores destes campos para R$ reais criando novas colunas com estes valores

select
*, 
round((latest_price * 0.063)) as latest_price_real,
round((old_price * 0.063)) as old_price_real
from cleaned_laptop_data_csv
limit 100;

-- COMMAND ----------

-- Aqui pegamos o valor do desconto que estava preenchido na coluna com número inteiro e transformamos esse valor em porcentagem dividindo por 100

select
*,
round((latest_price * 0.063)) as latest_price_real,
round((old_price * 0.063)) as old_price_real,
(discount / 100) as discount_percent
from cleaned_laptop_data_csv
limit 100;

-- COMMAND ----------

-- Select dos campos que serão utilizados neste projeto
-- Criação de uma view com as informações que precisamos para responder as perguntas da empresa

create view view_cleaned_laptop_data_csv
as
select
upper(brand) as brands,
model,
processor_brand,
processor_name,
ram_gb,
ram_type,
ssd,
hdd,
os,
os_bit,
graphic_card_gb,
display_size,
round((latest_price * 0.063)) as latest_price_real,
round((old_price * 0.063)) as old_price_real,
(discount / 100) as discount_percent,
star_rating,
ratings
from cleaned_laptop_data_csv;

-- COMMAND ----------

-- Qual marca de notebooks tem a média de preço mais barato com processador Core I3, 4GB Ram e monitor de 15 polegadas?
-- Os notebooks não podem ser Touchscreen

select
brands,
avg(latest_price_real) as avg_latest_price_real
from view_cleaned_laptop_data_csv
where processor_name = 'Core i3'
and ram_gb = '4 GB GB'
and display_size like '%15%'
group by brands
order by avg_latest_price_real asc;

-- COMMAND ----------

-- Qual marca de notebooks possui a melhor avaliação média com processador Core I3, 4GB Ram e monitor de 15 polegadas?
-- Os notebooks não podem ser Touchscreen

select
brands,
avg(star_rating) as avg_star_rating
from view_cleaned_laptop_data_csv
where processor_name = 'Core i3'
and ram_gb = '4 GB GB'
and display_size like '%15%'
group by brands
order by avg_star_rating desc;

-- COMMAND ----------

-- Qual marca de notebook que possuem HD com processador Core I3, 4GB Ram e monitor de 15 polegadas tem a média de preço mais barata?
-- Os notebooks não podem ser Touchscreen

select
brands,
avg(latest_price_real) as avg_latest_price_real
from view_cleaned_laptop_data_csv
where processor_name = 'Core i3'
and ram_gb = '4 GB GB'
and display_size like '%15%'
and hdd != '0 GB'
group by brands
order by avg_latest_price_real;

