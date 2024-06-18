depends_on: {{ ref('stg_trips') }}

{{
    config(
        tags=['unit-test']
    )
}}

{% call dbt_unit_testing.test('dim_trips', 'testing that I can get unit-test to work') %}
-- MOCK PART
  {% call dbt_unit_testing.mock_ref('stg_trips') %}
    SELECT 'AA' AS route_id
       -- select  'OCESN5983F3161409:2024-05-28T00:25:34Z' AS route_id 
  {% endcall %}

-- ASSERT PART
  {% call dbt_unit_testing.expect() %}
    SELECT 'AA' AS route_id  --  SELECT 'OCESN5983F3161409' AS trip_code, date::'2024-05-28' as trip_date
  {% endcall %}

{% endcall %}
