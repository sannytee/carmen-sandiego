select
    behavior
from {{ ref('reports') }}
group by behavior
order by count(*) desc
limit 3