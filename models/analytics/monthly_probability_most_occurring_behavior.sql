with reports_date_mapping as (
    select
        r.date_witness,
        dc.monthname as month,
        dc.year,
        r.behavior
    from {{ ref('reports') }}  r
    left join {{ ref('dimensional_calendar') }} dc on r.date_witness = dc.date
    left join {{ ref('locations') }} loc on r.location_id = loc.id
    left join {{ ref('cities') }}  cities on loc.city_agent_id = cities.id
),
most_occurring_behavior as (
    select
        *
    from  {{ ref('most_occurring_behavior') }}
),
count_occurrence_and_probability as (
select
    year,
    month,
    round(sum(
        case
            when behavior in (select * from most_occurring_behavior) then 1 else 0
        end
    ) * 1.0 / count(*) , 2)  as probability
from reports_date_mapping
group by year, month
)
select
    *
from count_occurrence_and_probability
order by year, month, probability