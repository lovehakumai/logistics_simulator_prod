WITH seeds_co2_emission AS (
    SELECT
        TRANSPORT_MODE
        , VEHICLE_TYPE
        , NVL(AIR_DISTANCE, 'NULL') AS AIR_DISTANCE
        , NVL(SEA_SIZE, 'NULL') AS SEA_SIZE
        , CASE 
            WHEN TRANSPORT_MODE = 'AIR' THEN 'Jet_Fuel' 
            WHEN TRANSPORT_MODE = 'RAIL' THEN 'Diesel'
            ELSE SEA_FUEL_TYPE 
        END AS FUEL_TYPE
        , WTW_CO2_G_T_KM
        , TTW_CO2_G_T_KM 
    FROM {{ref('stg_DEV_SEEDS__CO2_EMISSION')}}
)
, seeds_transport_fuel AS (
    SELECT
        TRANSPORT_MODE
        , VEHICLE_TYPE
        , NVL(AIR_DISTANCE, 'NULL') AS AIR_DISTANCE
        , NVL(SEA_SIZE, 'NULL') AS SEA_SIZE
        , CASE 
            WHEN TRANSPORT_MODE = 'AIR' THEN 'Jet_Fuel' 
            WHEN TRANSPORT_MODE = 'RAIL' THEN 'Diesel'
            ELSE SEA_FUEL_TYPE 
        END AS FUEL_TYPE
        , FUEL_L_T_KM
    FROM {{ref('stg_DEV_SEEDS__DIM_TRANSPORT_FUEL')}}
)
, merge_result AS (
    SELECT
        NVL(ce.TRANSPORT_MODE, tf.TRANSPORT_MODE) AS TRANSPORT_MODE
        , NVL(ce.VEHICLE_TYPE, tf.VEHICLE_TYPE) AS VEHICLE_TYPE
        , NVL(ce.AIR_DISTANCE, tf.AIR_DISTANCE) AS AIR_DISTANCE
        , NVL(ce.SEA_SIZE, tf.SEA_SIZE) AS SEA_SIZE
        , NVL(ce.FUEL_TYPE, tf.FUEL_TYPE) AS FUEL_TYPE
        , ce.WTW_CO2_G_T_KM
        , ce.TTW_CO2_G_T_KM
        , tf.FUEL_L_T_KM
    FROM seeds_co2_emission AS ce
    FULL JOIN seeds_transport_fuel AS tf 
    USING (TRANSPORT_MODE, VEHICLE_TYPE, AIR_DISTANCE, SEA_SIZE, FUEL_TYPE)
)
SELECT * FROM merge_result