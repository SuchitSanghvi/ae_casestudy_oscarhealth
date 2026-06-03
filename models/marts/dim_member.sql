with members as (
    select member_id from {{ ref('stg_claim_lines') }}
    union
    select member_id from {{ ref('stg_prescription_drugs') }}
)
select member_id
from members
