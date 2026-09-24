# Design Decision: Azure SQL Database vs. Azure Synapse Analytics

## Context

A retail organization needs a cloud target for consolidated analytical data. The candidates are Azure SQL Database and Azure Synapse Analytics.

## Evaluation Criteria

| Criterion | Azure SQL Database | Azure Synapse Analytics |
|---|---|---|
| Relational workload | Strong fit | Strong fit |
| Moderate data volume | Strong fit | Strong fit |
| Large-scale analytical processing | More limited | Strong fit |
| Operational simplicity | Lower complexity | More capacity/workload planning |
| SQL-based transformations | Strong fit | Strong fit |
| Initial cost control for this scenario | Strong fit | Requires deliberate capacity planning |
| Future warehouse-scale growth | May require evolution | Strong fit |

## Decision

For this portfolio scenario, Azure SQL Database is selected as the initial target.

The scenario assumes moderate data volume, relational source data, SQL-heavy transformations, scheduled ingestion, reporting workloads, and a need to control initial platform cost and operational complexity.

## Important Qualification

If actual production workloads later require substantially larger analytical processing, very high concurrency, or distributed warehouse-scale workloads, the architecture should be reevaluated.

The purpose of a POC is to evaluate fit against the actual business and technical constraints, not to declare a permanent winner.
