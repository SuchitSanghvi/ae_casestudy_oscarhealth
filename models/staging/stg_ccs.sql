with source as (
    select * from {{ source('raw', 'ccs') }}
),
cleaned as (
    select
        diag         as diagnosis_code,
        diag_desc,
        coalesce(ccs_1_desc, 'Unknown') as ccs_level_1,
        coalesce(ccs_2_desc, 'Unknown') as ccs_level_2,
        coalesce(ccs_3_desc, 'Unknown') as ccs_level_3
    from source
)
select *
from cleaned
