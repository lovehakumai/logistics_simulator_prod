WITH seeds_main_ports AS (SELECT * FROM {{ref('stg_DEV_SEEDS__MAIN_PORTS')}})
, seeds_carbon_tax AS (SELECT * FROM {{ref('stg_DEV_SEEDS__DIM_CARBON_TAX_RATES')}})
, seeds_transport_fuel AS (SELECT * FROM {{ref('stg_DEV_SEEDS__DIM_TRANSPORT_FUEL')}})
, seeds_co2_emission AS (SELECT * FROM {{ref('stg_DEV_SEEDS__CO2_EMISSION')}})
, seeds_thc AS (
    SELECT
        mp.COUNTRY_CD_2CHAR	
        , mp.COUNTRY_CD_3CHAR	
        , mp.COUNTRY_NAME	
        , mp.BASE_POINT	
        , mp.TRANSPORT_MODE	
        , mp.PORT_NAME_JP	
        , mp.PORT_NAME_EN	
        , mp.LATITUDE	
        , mp.LONGITUDE	
        , mp.COST_TYPE	
        , mp.COST_PER_KM_WT	
        , mp.COST_PER_CONTAINER	
        , mp.MINIMUM_CHARGE
        , ct.CARBON_TAX_PER_T_CO2
    FROM seeds_main_ports AS mp
    LEFT JOIN seeds_carbon_tax AS ct 
    USING (COUNTRY_CD_2CHAR) 
)
SELECT * FROM seeds_thc