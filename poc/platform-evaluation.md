# Platform Evaluation

## Scenario Assumptions

- Moderate initial data volume
- Relational source data
- SQL-heavy transformation
- Scheduled ingestion
- Business reporting and analytics
- Controlled initial budget
- Potential future growth

## Azure SQL Database

**Strengths for this scenario**
- Strong relational and T-SQL support
- Straightforward operational model
- Appropriate for moderate workloads
- Controlled initial platform footprint

**Considerations**
- Very large analytical workloads may require architectural evolution
- Distributed warehouse processing is not its primary strength

## Azure Synapse Analytics

**Strengths**
- Designed for analytical workloads
- Supports large-scale data warehousing
- Distributed processing capabilities
- Integrates with Azure analytics services

**Considerations**
- Capacity and workload planning are important
- Additional platform complexity may not be necessary for a moderate initial workload

## Portfolio Decision

Azure SQL Database is selected for the initial scenario because the expected workload is moderate and the scenario prioritizes controlled budget and operational simplicity.
