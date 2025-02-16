{{
  config(
    materialized='table'
  )
}}

SELECT DISTINCT 
  {{ dbt_utils.generate_surrogate_key([
	'Promotion'
  ]) }} as promotion_id,
  Promotion AS promotion
FROM
    {{ source('bronze', 'amazon_sale_report') }}