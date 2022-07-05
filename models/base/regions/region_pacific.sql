{% set fields_mapping = [
        {'source': 'sight_on', 'target': 'date_witness'},
        {'source': 'file_on', 'target': 'date_agent'},
        {'source': 'sighter', 'target': 'witness'},
        {'source': 'filer', 'target': 'agent'},
        {'source': 'lat', 'target': 'latitude'},
        {'source': 'long', 'target': 'longitude'},
        {'source': 'town', 'target': 'city'},
        {'source': 'nation', 'target': 'country'},
        {'source': 'report_office', 'target': 'city_agent'},
        {'source': 'has_weapon', 'target': 'has_weapon'},
        {'source': 'has_hat', 'target': 'has_hat'},
        {'source': 'has_jacket', 'target': 'has_jacket'},
        {'source': 'behavior', 'target': 'behavior'}
    ]
%}

select
    {{ map_columns(fields_mapping) }}
from {{ ref('seed_region_pacific') }}