with source as (
    select * from {{ source('raw', 'claim_lines') }}
),
cleaned as (
    select
        record_id,
        member_id,
        date_svc as date_of_service,
        REPLACE(REPLACE(diag1,'.,', ''), '.', '') as diagnosis_code,
        case when date_svc is null or date_svc < '1900-01-01' then 1 else 0 end as invalid_date_of_service,
        case when diag1 in ('999.99','000','KHD.X') or diag1 is null then 1
         else 0 end as invalid_diagnosis_code
    from source
)
select *
from cleaned