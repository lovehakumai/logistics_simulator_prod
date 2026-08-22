
  create or replace   view DBT_LOGISTICS.PUBLIC_STAGING.stg_DEV_SEEDS__DIM_TRANSPORT_FUEL
  
  
  
  
  as (
    with source as (
        select * from DBT_LOGISTICS.DEV_SEEDS.DIM_TRANSPORT_FUEL
  ),
  renamed as (
      select
          "TRANSPORT_MODE",
        "VEHICLE_TYPE",
        "AIR_DISTANCE",
        "SEA_SIZE",
        "SEA_FUEL_TYPE",
        "FUEL_L_T_KM"

      from source
  )
  select * from renamed
  );

