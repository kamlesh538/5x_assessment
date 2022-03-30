
with locations as (
    select distinct location_iso_code,
    location,
    location_level,
    province,
    country,
    continent,
    island,
    time_zone,
    total_regencies,
    total_cities,
    total_districts,
    total_urban_villages,
    total_rural_villages,
    latitude,
    longitude,
    population,
    population_density
    from {{ source('stage', 'COVID_19_INDONESIA_KAMLESH_SHARMA') }}
)
select * from locations