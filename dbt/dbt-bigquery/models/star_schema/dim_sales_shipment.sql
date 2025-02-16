{{
  config(
    materialized='table'
  )
}}

SELECT DISTINCT 
  {{ dbt_utils.generate_surrogate_key([
	'Courier Status'
  ]) }} as shipment_id,
  `Courier Status` AS courier_status
FROM
    {{ source('bronze', 'amazon_sale_report') }}