with summary_view as (
    select date,
    new_cases,
    new_active_cases,
    new_recovered,
    new_deaths,
    location_level,
    province,
    country,
    latitude,
    longitude
    from {{ ref('locations') }} l left join {{ ref('daily_cases') }} c
    on l.location_iso_code = c.location_iso_code
)

select * from summary_view