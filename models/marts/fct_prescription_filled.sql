with source as (
    select
        record_id,
        member_id,
        date_of_service,
        drug_code
    from {{ ref('stg_prescription_drugs') }}
    where invalid_date_of_service = 0
)
select * from source
