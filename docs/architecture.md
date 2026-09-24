# Architecture

## Source Layer
Synthetic CSV files represent customer, product, and order sources.

## Staging Layer
Raw records are loaded into staging tables before business transformations. This creates a controlled point for source validation, duplicate detection, null checks, and reconciliation.

## Transformation Layer
The transformation process standardizes source records, creates surrogate-key relationships, calculates order amounts, and loads the dimensional model.

## Dimensional Model

- `DimCustomer` — one row per customer
- `DimProduct` — one row per product
- `DimDate` — one row per calendar date
- `FactOrder` — one row per order line

## Data Quality Layer

Checks include duplicate business keys, missing mandatory fields, invalid quantities/prices, orphan foreign keys, source-to-target row counts, and revenue reconciliation.

## Consumption Layer

The model supports monthly revenue, category revenue, customer revenue, product performance, average order value, and running-revenue analysis.

## Design Principle

Ingestion, validation, transformation, and consumption are separated so that data defects can be identified before incorrect data reaches reporting.
