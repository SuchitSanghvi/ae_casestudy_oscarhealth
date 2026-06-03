with source as (
    select * from {{ source('raw', 'prescription_drugs') }}
),
cleaned as (
    select
        record_id,
        member_id,
        date_svc      as date_of_service,
        ndc           as drug_code,
        drug_category,
        drug_group,
        drug_class,
        case when date_svc is null or date_svc < '1900-01-01' then 1 else 0 end as invalid_date_of_service
    from source
)
select *
from cleaned
