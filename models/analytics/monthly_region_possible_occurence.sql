with reports_date_mapping as (
    select
        r.date_witness,
        dc.daysinmonth,
        dc.monthname as month,
        dc.year,
        cities.name as agency_city
    from {{ ref('reports') }} r
    left join {{ ref('dimensional_calendar') }} dc on r.date_witness = dc.date
    left join {{ ref('locations') }} loc on r.location_id = loc.id
    left join {{ ref('cities') }} cities on loc.city_agent_id = cities.id
),
probability_calc as (
    select
        year,
        month,
        daysinmonth,
        agency_city,
        count(*) / daysinmonth as probability
    from reports_date_mapping
    group by year, month, daysinmonth, agency_city
)
select
    year,
    month,
    agency_city,
    round(probability::numeric, 2) as probability
from (
    select
        *,
        rank() over (PARTITION by year, month order by probability desc) as rank
        from probability_calc
) prob_calc where prob_calc.rank = 1