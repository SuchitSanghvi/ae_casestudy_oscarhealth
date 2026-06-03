with drugs as (
    select distinct
        drug_code,
        drug_category,
        drug_group,
        drug_class
    from {{ ref('stg_prescription_drugs') }}
    qualify row_number() over (partition by drug_code order by drug_category, drug_group, drug_class) = 1
)
select * from drugs
