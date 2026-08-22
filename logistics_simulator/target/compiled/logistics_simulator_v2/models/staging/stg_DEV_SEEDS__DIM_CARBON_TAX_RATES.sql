with source as (
        select * from DBT_LOGISTICS.DEV_SEEDS.DIM_CARBON_TAX_RATES
  ),
  renamed as (
      select
          "COUNTRY_CD_2CHAR",
        "COUNTRY_CD_3CHAR",
        "COUNTRY_NAME",
        "BASE_POINT",
        "CARBON_TAX_PER_T_CO2"

      from source
  )
  select * from renamed