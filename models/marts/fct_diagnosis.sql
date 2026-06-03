with source as (
    select
        record_id,
        member_id,
        date_of_service,
        diagnosis_code
    from {{ ref('stg_claim_lines') }}
    where invalid_date_of_service = 0
      and invalid_diagnosis_code   = 0
)
select * from source
