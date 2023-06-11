SELECT 
  id, 
  created_at, 
  mql_date, 
  sel_date, 
  email, 
  phone, 
  sales_region 
FROM {{ ref('contacts') }}
WHERE type = 'Agent'