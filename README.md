# ae_casestudy_oscarhealth

dbt project transforming healthcare claims, CCS reference, and prescription data into a dimensional model using DuckDB.

## Prerequisites

- Python 3.9+
- `dbt-duckdb` — `pip install dbt-duckdb`

## Setup

Set the environment variable pointing to the folder containing the three source CSVs (`claim_lines.csv`, `ccs.csv`, `prescription_drugs.csv`):

```bash
export RAW_DATA_PATH="/path/to/csv/folder"
```

Or add it to a `.env` file and run `source .env` before building.

## Run

```bash
dbt build
```

This creates the raw views, runs all models, and executes tests.

## Model layers

**staging** — one model per source. Renames columns to consistent conventions, casts types, and flags invalid dates and diagnosis codes. No business logic.

**marts** — dimensional model ready for analysis:
- `dim_member`, `dim_date`, `dim_diagnosis`, `dim_drug` — conformed dimensions
- `fct_diagnosis` — one row per claim line (invalid dates and codes excluded)
- `fct_prescription_filled` — one row per prescription fill (invalid dates excluded)
