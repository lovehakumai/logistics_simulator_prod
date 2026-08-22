
  create or replace   view DBT_LOGISTICS.PUBLIC_STAGING.stg_DEV_SEEDS__MAIN_PORTS
  
  
  
  
  as (
    with source as (
        select * from DBT_LOGISTICS.DEV_SEEDS.MAIN_PORTS
  ),
  renamed as (
      select
          "ID",
        "COUNTRY_CD_2CHAR",
        "COUNTRY_CD_3CHAR",
        "COUNTRY_NAME",
        "BASE_POINT",
        "TRANSPORT_MODE",
        "PORT_NAME_JP",
        "PORT_NAME_EN",
        "COST_TYPE",
        "COST_PER_KM_WT",
        "COST_PER_CONTAINER",
        "MINIMUM_CHARGE",
        "LATITUDE",
        "LONGITUDE"

      from source
  )
  select * from renamed
  );

