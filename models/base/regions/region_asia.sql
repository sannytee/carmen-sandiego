{% set fields_mapping = [
        {'source': 'sighting', 'target': 'date_witness'},
        {'source': '报道', 'target': 'date_agent'},
        {'source': 'citizen', 'target': 'witness'},
        {'source': 'officer', 'target': 'agent'},
        {'source': '纬度', 'target': 'latitude'},
        {'source': '经度', 'target': 'longitude'},
        {'source': 'city', 'target': 'city'},
        {'source': 'nation', 'target': 'country'},
        {'source': 'city_interpol', 'target': 'city_agent'},
        {'source': 'has_weapon', 'target': 'has_weapon'},
        {'source': 'has_hat', 'target': 'has_hat'},
        {'source': 'has_jacket', 'target': 'has_jacket'},
        {'source': 'behavior', 'target': 'behavior'}
    ]
%}
select
    {{ map_columns(fields_mapping) }}
from {{ ref('seed_region_asia') }}