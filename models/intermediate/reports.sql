with all_reports_across_regions as (
    select * from {{ ref('all_regions')}}
),
location_cities as (
    select
        loc.id as location_id,
        loc.latitude,
        loc.longitude,
        witness_cities.country as witness_country,
        agent_cities.name as agent_city,
        witness_cities.name as witness_city
    from {{ ref('locations') }} loc
    left join {{ ref('cities') }} witness_cities on loc.city_id = witness_cities.id
    left join {{ ref('cities') }} agent_cities on loc.city_agent_id = agent_cities.id
),
transformed_reports as (
    select
        agent.id as agent_id,
        witness.id as witness_id,
        lc.location_id,
        arar.date_agent,
        arar.date_witness,
        arar.has_weapon,
        arar.has_hat,
        arar.has_jacket,
        arar.behavior
    from all_reports_across_regions arar
    left join {{ ref('persons') }} agent on arar.agent = agent.full_name
    left join {{ ref('persons') }} witness on arar.witness = witness.full_name
    left join location_cities lc on arar.latitude = lc.latitude
)
select
    {{
        dbt_utils.surrogate_key(["witness_id", "agent_id", "location_id", "date_witness"])
    }} as id,
    agent_id,
    witness_id,
    location_id,
    date_agent,
    date_witness,
    has_weapon,
    has_hat,
    has_jacket,
    behavior
from transformed_reports