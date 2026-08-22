with source as (
        select * from {{ source('RAW', 'GLOBAL_SUPPLY_CHAIN_RISK_2024_2026') }}
  ),
  renamed as (
      select
          {{ adapter.quote("Shipment_ID") }} AS SHIPMENT_ID,
        TO_DATE("Date") AS DATE,
        {{ adapter.quote("Origin_Port") }} AS ORIGIN_PORT,
        {{ adapter.quote("Destination_Port") }} AS DESTINATION_PORT,
        {{ adapter.quote("Transport_Mode") }} AS TRANSPORT_MODE,
        {{ adapter.quote("Product_Category") }} AS PRODUCT_CATEGORY,
        {{ adapter.quote("Distance_km") }} AS DISTANCE_KM,
        {{ adapter.quote("Weight_MT") }} AS WEIGHT_MT,
        {{ adapter.quote("Fuel_Price_Index") }} AS FUEL_PRICE_INDEX,
        {{ adapter.quote("Geopolitical_Risk_Score") }} AS GEOGRAPHICAL_RISK_SCORE,
        {{ adapter.quote("Weather_Condition") }} AS WEATHER_CONDITION,
        {{ adapter.quote("Carrier_Reliability_Score") }} AS CARRIER_RELIABILITY_SCORE,
        {{ adapter.quote("Lead_Time_Days") }} AS LEAD_TIME_DAYS,
        {{ adapter.quote("Disruption_Occurred") }} AS DISRUPTION_OCCURRED

      from source
  )
  select * from renamed
    