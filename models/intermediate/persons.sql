with data_across_regions as (
    select
        witness,
        agent
    from {{ ref('all_regions') }}

),
unpivot_persons as (
    select
        distinct t.full_name
    from data_across_regions dar
    cross join lateral (
        values
            (dar.witness),
            (dar.agent)
    ) as t(full_name)
)
select
    {{
        dbt_utils.surrogate_key(['full_name'])
    }} as id,
    full_name
from unpivot_persons