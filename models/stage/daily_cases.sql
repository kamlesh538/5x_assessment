with daily_cases as (
    select to_date(date) as date,
    location_iso_code,
    new_cases,
    new_active_cases,
    new_recovered,
    new_deaths,
    total_cases,
    total_active_cases,
    total_recovered,
    total_deaths

    from {{ source('stage', 'COVID_19_INDONESIA_KAMLESH_SHARMA') }}
)

select * from covid_cases