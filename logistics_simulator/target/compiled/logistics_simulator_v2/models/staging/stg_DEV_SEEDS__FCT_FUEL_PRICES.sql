with source as (
        select * from DBT_LOGISTICS.DEV_SEEDS.FCT_FUEL_PRICES
  ),
  renamed as (
      select
          "DATE",
        "FUEL_TYPE",
        "FUEL_PRICE_USD_PER_L"

      from source
  )
  select * from renamed