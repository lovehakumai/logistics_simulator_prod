
  create or replace   view DBT_LOGISTICS.PUBLIC_STAGING.stg_DEV_SEEDS__CO2_EMISSION
  
  
  
  
  as (
    with source as (
        select * from DBT_LOGISTICS.DEV_SEEDS.CO2_EMISSION
  ),
  renamed as (
      select
          "TRANSPORT_MODE",
        "VEHICLE_TYPE",
        "AIR_DISTANCE",
        "SEA_SIZE",
        "SEA_FUEL_TYPE",
        "WTW_CO2_G_T_KM",
        "TTW_CO2_G_T_KM"

      from source
  )
  select * from renamed
  );

