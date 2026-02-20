select
    c.customer_name,
    c.market_segment,
    o.status,
    date_trunc('month', o.order_date) as order_month,
    count(o.order_id)                 as total_orders,
    sum(o.total_price)                as total_revenue
from {{ ref('stg_orders') }} o
left join {{ ref('stg_customers') }} c
    on o.customer_id = c.customer_id
group by 1, 2, 3, 4
