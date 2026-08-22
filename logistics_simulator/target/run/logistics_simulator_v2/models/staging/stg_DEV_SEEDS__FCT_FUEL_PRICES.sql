
  create or replace   view DBT_LOGISTICS.PUBLIC_STAGING.stg_DEV_SEEDS__FCT_FUEL_PRICES
  
  
  
  
  as (
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
  );

