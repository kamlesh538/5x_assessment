with monthly_cases as (
    select year(date) as year,
    (case when month(date)=1 then 'JAN' 
          when month(date)=2 then 'FEB'
          when month(date)=3 then 'MAR'
          when month(date)=4 then 'APR'
          when month(date)=5 then 'MAY'
          when month(date)=6 then 'JUN'
          when month(date)=7 then 'JUL'
          when month(date)=8 then 'AUG'
          when month(date)=9 then 'SEPT'
          when month(date)=10 then 'OCT'
          when month(date)=11 then 'NOV'
          when month(date)=12 then 'DEC' END) as month,
    sum(new_cases) as new_cases,
    sum(new_active_cases) as new_active_cases,
    sum(new_recovered) as new_recovered,
    sum(new_deaths) as new_deaths,
    sum(total_cases) as total_cases,
    sum(total_active_cases) as total_active_cases,
    sum(total_recovered) as total_recovered,
    sum(total_deaths) as total_deaths
    from {{ ref('daily_cases') }}
    group by year, month
    order by year, month asc
)

select * from monthly_cases