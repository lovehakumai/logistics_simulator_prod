with source as (
        select * from {{ source('DEV_SEEDS', 'FCT_FUEL_PRICES') }}
  ),
  renamed as (
      select
          {{ adapter.quote("DATE") }},
        {{ adapter.quote("FUEL_TYPE") }},
        {{ adapter.quote("FUEL_PRICE_USD_PER_L") }}

      from source
  )
  select * from renamed
    