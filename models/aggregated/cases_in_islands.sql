with cases_in_islands as (
    select island,
    sum(new_cases) as new_cases,
    sum(new_active_cases) as new_active_cases,
    sum(new_recovered) as new_recovered,
    sum(new_deaths) as new_deaths,
    sum(total_cases) as total_cases,
    sum(total_active_cases) as total_active_cases,
    sum(total_recovered) as total_recovered,
    sum(total_deaths) as total_deaths
    from {{ ref('locations') }} l left join {{ ref('daily_cases') }} c
    on l.location_iso_code = c.location_iso_code
    where island is not null
    group by island
)

select * from cases_in_islands