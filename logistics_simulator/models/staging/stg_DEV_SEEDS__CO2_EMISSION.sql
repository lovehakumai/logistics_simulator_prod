with source as (
        select * from {{ source('DEV_SEEDS', 'CO2_EMISSION') }}
  ),
  renamed as (
      select
          {{ adapter.quote("TRANSPORT_MODE") }},
        {{ adapter.quote("VEHICLE_TYPE") }},
        {{ adapter.quote("AIR_DISTANCE") }},
        {{ adapter.quote("SEA_SIZE") }},
        {{ adapter.quote("SEA_FUEL_TYPE") }},
        {{ adapter.quote("WTW_CO2_G_T_KM") }},
        {{ adapter.quote("TTW_CO2_G_T_KM") }}

      from source
  )
  select * from renamed
    