with reports_date_mapping as (
    select
        r.date_witness,
        dc.monthname as month,
        dc.year,
        r.has_jacket,
        r.has_weapon,
        r.has_hat
    from {{ ref('reports') }} r
    left join {{ ref('dimensional_calendar') }} dc on r.date_witness = dc.date
    left join {{ ref('locations') }} loc on r.location_id = loc.id
    left join {{ ref('cities') }} cities on loc.city_agent_id = cities.id
),
probability_calc as (
    select
    year,
    month,
    sum(
        case
            when has_jacket is true then 1 else 0
        end
    ) * 1.0 / count(*) as jacket_probability,
    sum(
        case
            when has_weapon is true then 1 else 0
        end
    ) * 1.0 / count(*) as weapon_probability,
    sum(
        case
            when has_hat is false then 1 else 0
        end
    ) * 1.0 / count(*) as hat_probability
from reports_date_mapping
group by year, month
),
required_event_probability as (
    select
        year,
        month,
        round(jacket_probability, 2) as jacket_probability,
        round(weapon_probability, 2) as weapon_probability,
        round(hat_probability, 2) as hat_probability,
        round(
            (jacket_probability * weapon_probability * hat_probability)
        , 2) as jacket_weapon_not_hat_probability
    from probability_calc
)
select
   *
from required_event_probability
order by year, jacket_weapon_not_hat_probability desc