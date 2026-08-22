with source as (
        select * from {{ source('DEV_SEEDS', 'MAIN_PORTS') }}
  ),
  renamed as (
      select
          {{ adapter.quote("ID") }},
        {{ adapter.quote("COUNTRY_CD_2CHAR") }},
        {{ adapter.quote("COUNTRY_CD_3CHAR") }},
        {{ adapter.quote("COUNTRY_NAME") }},
        {{ adapter.quote("BASE_POINT") }},
        {{ adapter.quote("TRANSPORT_MODE") }},
        {{ adapter.quote("PORT_NAME_JP") }},
        {{ adapter.quote("PORT_NAME_EN") }},
        {{ adapter.quote("COST_TYPE") }},
        {{ adapter.quote("COST_PER_KM_WT") }},
        {{ adapter.quote("COST_PER_CONTAINER") }},
        {{ adapter.quote("MINIMUM_CHARGE") }},
        {{ adapter.quote("LATITUDE") }},
        {{ adapter.quote("LONGITUDE") }}

      from source
  )
  select * from renamed
    