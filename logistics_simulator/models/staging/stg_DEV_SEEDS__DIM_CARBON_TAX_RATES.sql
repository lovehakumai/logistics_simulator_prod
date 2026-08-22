with source as (
        select * from {{ source('DEV_SEEDS', 'DIM_CARBON_TAX_RATES') }}
  ),
  renamed as (
      select
          {{ adapter.quote("COUNTRY_CD_2CHAR") }},
        {{ adapter.quote("COUNTRY_CD_3CHAR") }},
        {{ adapter.quote("COUNTRY_NAME") }},
        {{ adapter.quote("BASE_POINT") }},
        {{ adapter.quote("CARBON_TAX_PER_T_CO2") }}

      from source
  )
  select * from renamed
    