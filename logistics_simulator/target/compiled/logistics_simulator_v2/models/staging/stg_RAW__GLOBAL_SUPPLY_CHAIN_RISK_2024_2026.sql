with source as (
        select * from DBT_LOGISTICS.RAW.GLOBAL_SUPPLY_CHAIN_RISK_2024_2026
  ),
  renamed as (
      select
          "Shipment_ID" AS SHIPMENT_ID,
        TO_DATE("Date") AS DATE,
        "Origin_Port" AS ORIGIN_PORT,
        "Destination_Port" AS DESTINATION_PORT,
        "Transport_Mode" AS TRANSPORT_MODE,
        "Product_Category" AS PRODUCT_CATEGORY,
        "Distance_km" AS DISTANCE_KM,
        "Weight_MT" AS WEIGHT_MT,
        "Fuel_Price_Index" AS FUEL_PRICE_INDEX,
        "Geopolitical_Risk_Score" AS GEOGRAPHICAL_RISK_SCORE,
        "Weather_Condition" AS WEATHER_CONDITION,
        "Carrier_Reliability_Score" AS CARRIER_RELIABILITY_SCORE,
        "Lead_Time_Days" AS LEAD_TIME_DAYS,
        "Disruption_Occurred" AS DISRUPTION_OCCURRED

      from source
  )
  select * from renamed