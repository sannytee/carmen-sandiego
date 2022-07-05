{% set fields_mapping = [
        {'source': 'date_witness', 'target': 'date_witness'},
        {'source': 'date_filed', 'target': 'date_agent'},
        {'source': 'witness', 'target': 'witness'},
        {'source': 'agent', 'target': 'agent'},
        {'source': 'lat_', 'target': 'latitude'},
        {'source': 'long_', 'target': 'longitude'},
        {'source': 'city', 'target': 'city'},
        {'source': 'country', 'target': 'country'},
        {'source': 'region_hq', 'target': 'city_agent'},
        {'source': '"armed?"', 'target': 'has_weapon'},
        {'source': '"chapeau?"', 'target': 'has_hat'},
        {'source': '"coat?"', 'target': 'has_jacket'},
        {'source': 'observed_action', 'target': 'behavior'}
    ]
%}

select
    {{ map_columns(fields_mapping) }}
from {{ ref('seed_region_europe') }}