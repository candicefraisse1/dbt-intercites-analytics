select route_id, route_short_name, route_long_name, route_desc
from {{ ref('stg_routes') }}
