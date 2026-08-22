with source as (
        select * from {{ source('DEV_SEEDS', 'DIM_TRANSPORT_FUEL') }}
  ),
  renamed as (
      select
          {{ adapter.quote("TRANSPORT_MODE") }},
        {{ adapter.quote("VEHICLE_TYPE") }},
        {{ adapter.quote("AIR_DISTANCE") }},
        {{ adapter.quote("SEA_SIZE") }},
        {{ adapter.quote("SEA_FUEL_TYPE") }},
        {{ adapter.quote("FUEL_L_T_KM") }}

      from source
  )
  select * from renamed
    