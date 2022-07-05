with cities_across_all_regions as (
   select * from {{ ref('all_regions') }}
),
sighting_cities_across_all_regions as (
       select
             country,
             city,
             city_agent
      from cities_across_all_regions calr
      group by  country, city, city_agent
),
unpivot_cities as (
    select
        distinct scalr.country,
        t.name
    from sighting_cities_across_all_regions scalr
    cross join lateral (
        values
            (scalr.city_agent),
            (scalr.city)
    ) as t(name)
)
select
    {{
        dbt_utils.surrogate_key(['name', 'country'])
    }} as id,
    name,
    country
from unpivot_cities