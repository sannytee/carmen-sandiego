with all_regions as (
    select
        *
    from {{ ref('region_africa') }}
    union
    select
        *
    from {{ ref('region_america') }}
    union
    select
        *
    from {{ ref('region_asia') }}
    union
    select
        *
    from {{ ref('region_atlantic') }}
    union
    select
        *
    from {{ ref('region_australia') }}
    union
    select
        *
    from {{ ref('region_europe') }}
    union
    select
        *
    from {{ ref('region_indian') }}
    union
    select
        *
    from {{ ref('region_pacific') }}
)
select * from all_regions