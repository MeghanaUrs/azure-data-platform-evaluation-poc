# Implementation Notes

## 1. Data Model
The project uses staging tables and a simple star schema.

## 2. Data Loading
Synthetic CSV files are loaded into staging. Dimensions are populated first, followed by the fact table.

## 3. Transformation
Order-line gross and net amounts are calculated from quantity, unit price, and discount.

## 4. Validation
The quality script checks duplicates, mandatory fields, invalid values, orphan references, row counts, and revenue reconciliation.

## 5. Analytics
The final script demonstrates monthly revenue, category revenue, top customers, top products, and running revenue.

## Future Production Enhancements
ADF orchestration, ADLS Gen2 landing, incremental loads, SCD Type 2, automated quality gates, CI/CD, monitoring, RBAC, lineage, and Power BI could be added in a production implementation.
