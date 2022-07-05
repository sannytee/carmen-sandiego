with location_across_all_regions as (
    select
        latitude,
        longitude,
        city,
        city_agent,
        country
    from {{ ref('region_africa') }}
    union
    select
        latitude,
        longitude,
        city,
        city_agent,
        country
    from {{ ref('region_america') }}
    union
    select
        latitude,
        longitude,
        city,
        city_agent,
        country
    from {{ ref('region_asia') }}
    union
    select
        latitude,
        longitude,
        city,
        city_agent,
        country
    from {{ ref('region_atlantic') }}
    union
    select
        latitude,
        longitude,
        city,
        city_agent,
        country
    from {{ ref('region_australia') }}
    union
    select
        latitude,
        longitude,
        city,
        city_agent,
        country
    from {{ ref('region_europe') }}
    union
    select
        latitude,
        longitude,
        city,
        city_agent,
        country
    from {{ ref('region_indian') }}
    union
    select
        latitude,
        longitude,
        city,
        city_agent,
        country
    from {{ ref('region_pacific') }}
),
map_location_with_city_id as (
    select
        laar.latitude,
        laar.longitude,
        cities.id as city_id,
        agent_cities.id as city_agent_id
    from location_across_all_regions laar
    left join {{ ref('cities') }} cities on laar.city = cities.name and laar.country = cities.country
    left join {{ ref('cities') }} agent_cities on laar.city_agent = agent_cities.name and laar.country = agent_cities.country
)
select
    {{
        dbt_utils.surrogate_key(["latitude", "longitude", "city_id", "city_agent_id"])
    }} as id,
    latitude,
    longitude,
    city_id,
    city_agent_id
from map_location_with_city_id

