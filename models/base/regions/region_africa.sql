{% set fields_mapping = [
        {'source': 'date_witness', 'target': 'date_witness'},
        {'source': 'date_agent', 'target': 'date_agent'},
        {'source': 'witness', 'target': 'witness'},
        {'source': 'agent', 'target': 'agent'},
        {'source': 'latitude', 'target': 'latitude'},
        {'source': 'longitude', 'target': 'longitude'},
        {'source': 'city', 'target': 'city'},
        {'source': 'country', 'target': 'country'},
        {'source': 'region_hq', 'target': 'city_agent'},
        {'source': 'has_weapon', 'target': 'has_weapon'},
        {'source': 'has_hat', 'target': 'has_hat'},
        {'source': 'has_jacket', 'target': 'has_jacket'},
        {'source': 'behavior', 'target': 'behavior'}
    ]
%}
select
    {{ map_columns(fields_mapping) }}
from {{ ref('seed_region_africa') }}