with weekly_cases as (
    select year(date) as year,
    week(date) as week,
    sum(new_cases) as new_cases,
    sum(new_active_cases) as new_active_cases,
    sum(new_recovered) as new_recovered,
    sum(new_deaths) as new_deaths,
    sum(total_cases) as total_cases,
    sum(total_active_cases) as total_active_cases,
    sum(total_recovered) as total_recovered,
    sum(total_deaths) as total_deaths
    from {{ ref('daily_cases') }}
    group by year, week
    order by year, week asc
)

select * from weekly_cases