{% set fields_mapping = [
        {'source': 'witnessed', 'target': 'date_witness'},
        {'source': 'reported', 'target': 'date_agent'},
        {'source': 'observer', 'target': 'witness'},
        {'source': 'field_chap', 'target': 'agent'},
        {'source': 'lat', 'target': 'latitude'},
        {'source': 'long', 'target': 'longitude'},
        {'source': 'place', 'target': 'city'},
        {'source': 'nation', 'target': 'country'},
        {'source': 'interpol_spot', 'target': 'city_agent'},
        {'source': 'has_weapon', 'target': 'has_weapon'},
        {'source': 'has_hat', 'target': 'has_hat'},
        {'source': 'has_jacket', 'target': 'has_jacket'},
        {'source': 'state_of_mind', 'target': 'behavior'}
    ]
%}

select
    {{ map_columns(fields_mapping) }}
from {{ ref('seed_region_australia') }}