with claim_diagnoses as (
    select distinct diagnosis_code
    from {{ ref('stg_claim_lines') }}
    where invalid_diagnosis_code = 0
),
ccs as (
    select * from {{ ref('stg_ccs') }}
),
joined as (
    select
        cd.diagnosis_code,
        ccs.diag_desc,
        ccs.ccs_level_1,
        ccs.ccs_level_2,
        ccs.ccs_level_3
    from claim_diagnoses cd
    left join ccs
        on cd.diagnosis_code = ccs.diagnosis_code
)
select * from joined
