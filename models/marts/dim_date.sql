with dates as (
    select date_of_service
    from {{ ref('stg_claim_lines') }}
    where invalid_date_of_service = 0

    union

    select date_of_service
    from {{ ref('stg_prescription_drugs') }}
    where invalid_date_of_service = 0
)
select
    date_of_service,
    extract(month   from date_of_service) as month,
    extract(quarter from date_of_service) as quarter,
    extract(year    from date_of_service) as year
from dates
