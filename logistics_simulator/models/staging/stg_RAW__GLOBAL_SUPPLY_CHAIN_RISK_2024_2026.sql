with source as (
        select * from {{ source('RAW', 'GLOBAL_SUPPLY_CHAIN_RISK_AND_LOGISTICS_2024_2026') }}
  ),
  renamed as (
      select
          {{ adapter.quote("SHIPMENT_ID") }} AS SHIPMENT_ID,
        TO_DATE("DATE") AS DATE,
        {{ adapter.quote("ORIGIN_PORT") }} AS ORIGIN_PORT,
        {{ adapter.quote("DESTINATION_PORT") }} AS DESTINATION_PORT,
        {{ adapter.quote("TRANSPORT_MODE") }} AS TRANSPORT_MODE,
        {{ adapter.quote("PRODUCT_CATEGORY") }} AS PRODUCT_CATEGORY,
        {{ adapter.quote("DISTANCE_KM") }} AS DISTANCE_KM,
        {{ adapter.quote("WEIGHT_MT") }} AS WEIGHT_MT,
        {{ adapter.quote("FUEL_PRICE_INDEX") }} AS FUEL_PRICE_INDEX,
        {{ adapter.quote("GEOPOLITICAL_RISK_SCORE") }} AS GEOGRAPHICAL_RISK_SCORE,
        {{ adapter.quote("WEATHER_CONDITION") }} AS WEATHER_CONDITION,
        {{ adapter.quote("CARRIER_RELIABILITY_SCORE") }} AS CARRIER_RELIABILITY_SCORE,
        {{ adapter.quote("LEAD_TIME_DAYS") }} AS LEAD_TIME_DAYS,
        {{ adapter.quote("DISRUPTION_OCCURRED") }} AS DISRUPTION_OCCURRED

      from source
  )
  select * from renamed
    