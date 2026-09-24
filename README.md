# Azure Data Platform Evaluation POC

## Azure SQL Database vs. Azure Synapse Analytics

This is an original portfolio project using synthetic retail data. It demonstrates enterprise-style data-platform evaluation, SQL modeling, transformation, data quality, reconciliation, analytics, and technical decision documentation.

**Confidentiality note:** This repository contains no employer-confidential code, data, architecture, or documentation.

## Business Scenario

A retail organization wants to consolidate customer, product, and order data into a cloud platform for analytics. Azure SQL Database and Azure Synapse Analytics are being evaluated.

## Objectives

- Design a simple dimensional model
- Transform staged operational data
- Implement data-quality and reconciliation checks
- Demonstrate analytical SQL
- Evaluate Azure SQL Database vs. Synapse
- Document a platform decision considering technical fit and budget

## Architecture

```text
Synthetic CSV Sources
        |
        v
   Staging Tables
        |
        v
 Data Quality Checks
        |
        v
Dimensional Model
(DimCustomer, DimProduct, DimDate, FactOrder)
        |
        v
 Analytical SQL / BI Consumption
```

## Repository Structure

```text
azure-data-platform-poc/
├── README.md
├── data/
├── docs/
├── poc/
└── sql/
```

## Key Design Decision

For this portfolio scenario, **Azure SQL Database is selected as the initial target platform** because the assumed workload is moderate, strongly relational, and the scenario prioritizes controlled initial cost and operational simplicity.

This is a workload-specific portfolio decision, not a universal claim that Azure SQL is better than Synapse.

## Original Contribution

I designed and implemented this POC end-to-end, including the business scenario, synthetic data, dimensional model, SQL DDL, transformations, data-quality checks, reconciliation queries, analytical queries, platform evaluation criteria, and design-decision documentation.

## How to Run

The SQL is written in a SQL Server/Azure SQL compatible style.

1. Create an Azure SQL Database or SQL Server development database.
2. Run `sql/01_create_tables.sql`.
3. Import the CSV files from `data/` into the staging tables.
4. Run `sql/02_load_and_transform.sql`.
5. Run `sql/03_data_quality_checks.sql`.
6. Run `sql/04_analytics_queries.sql`.

The repository can also be reviewed without deploying Azure infrastructure.

## Production Extensions

If expanded into a production platform, potential next steps would include Azure Data Factory orchestration, ADLS Gen2 landing, incremental/watermark loads, SCD Type 2 where required, automated quality gates, CI/CD, monitoring, RBAC, lineage/governance, and Power BI semantic modeling.

These are documented as future extensions and are not claimed as production implementations in this repository.
