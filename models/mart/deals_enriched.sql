SELECT 
  d.id, 
  d.created_at, 
  d.deal_stage, 
  d.offer_sent_at, 
  d.verbal_order_at, 
  d.approved_at, 
  d.drop_out_at, 
  d.course_id, 
  d.direct_entry,
  c.id as customer_id, 
  a.id as agent_id, 
  crs.course_type,
  crs.course_name
FROM {{ref('deals')}} as d
JOIN {{ref('associations')}} as assoc_customer ON d.id = assoc_customer.to_id
AND assoc_customer.from_type = 'contact' AND assoc_customer.to_type = 'deal'
JOIN {{ref('customers')}} as c ON  assoc_customer.from_id = cast(c.id as varchar)
JOIN {{ref('associations')}} as assoc_agent ON d.id = assoc_agent.from_id
AND assoc_agent.from_type = 'deal' AND assoc_agent.to_type = 'contact'
JOIN {{ref('agents')}}as a ON assoc_agent.to_id = cast(a.id as varchar)
JOIN {{ref('courses')}} as crs ON d.course_id = crs.id
