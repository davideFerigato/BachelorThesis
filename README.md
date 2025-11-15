# Advanced Query Optimization in Business Intelligence Systems

Bachelor's thesis on advanced techniques for query optimization in Business Intelligence (BI) systems, with a focus on Data Warehouse and ETL architectures and their impact on analytical workloads.

## Abstract

This work examines advanced techniques for query optimization in Business Intelligence systems, considering Data Warehouse and ETL architectures. It integrates theory and practice: from physical design (indexing, partitioning, compression, caching) to view materialization, up to measurable performance metrics and governance. The main goal is to define reproducible procedures to reduce latency and I/O while preserving data quality and freshness.

The thesis follows a progressive structure. It recalls the fundamentals of BI and the differences between OLTP and OLAP; it examines ETL quality and the impact of structural metrics; it explores physical design choices for analytical workloads in depth. It then frames the role of materialized views in reducing query costs and, in the applied chapter, analyzes SQL Server and Azure Synapse: creation requirements, automatic query rewriting, data distribution, statistics, usage of CTAS and temporary tables, diagnostic tools, and overhead.

The methodology combines a literature review, a comparison of classical approaches for view selection and maintenance, and an experimental protocol inspired by decision-support benchmarks. The metrics considered include average response times and dispersion, maintenance cost in the presence of updates, and impact on I/O and storage.

The results converge into operational guidelines: a columnstore and partitioned physical base, views designed over shared joins and aggregations with consistent data distribution, validation through automatic query rewriting, and overhead thresholds for rebuild operations. Overall, the coordinated adoption of these techniques consistently reduces query latency and improves the global efficiency of the Data Warehouse, providing practical and reproducible guidance.

## Keywords

- Business Intelligence (BI)  
- Data Warehouse  
- ETL (Extract–Transform–Load)  
- Query Optimization  
- Physical Design (indexes, partitioning, compression, caching)  
- Materialized Views  
- SQL Server  
- Azure Synapse Analytics  
- Columnstore  
- Performance Metrics & Governance  

## Main Objectives

- Analyze the impact of physical design techniques on query performance in BI workloads.  
- Study the role of materialized views in reducing query cost and latency.  
- Evaluate how SQL Server and Azure Synapse implement and exploit materialized views for OLAP scenarios.  
- Define reproducible procedures and guidelines for performance tuning in Data Warehouse environments.

## Methodology

- **Literature review** on BI architectures, Data Warehousing, ETL quality, and classical approaches to view selection and maintenance.  
- **Theoretical analysis** of physical design choices for analytical workloads (indexing, partitioning, compression, caching).  
- **Practical study** of SQL Server and Azure Synapse features:
  - Indexed/materialized views  
  - Automatic query rewriting and view matching  
  - Data distribution strategies  
  - Statistics, CTAS, temporary tables, and diagnostic tools  
- **Experimental evaluation** using decision-support style workloads, measuring:
  - Average query times and dispersion  
  - Maintenance overhead in the presence of data updates  
  - Impact on I/O and storage consumption  

## Contributions

- A structured comparison of advanced query optimization techniques for BI systems.  
- A practical framework for designing and validating materialized views on SQL Server and Azure Synapse.  
- Operational guidelines that link:
  - Columnstore and partitioning strategies  
  - Design of views over shared joins and aggregations  
  - Overhead-oriented thresholds for rebuild and maintenance  
- A reproducible methodology that can be applied to real-world Data Warehouses to systematically reduce latency and improve efficiency.

## Repository Contents

> Adjust this section to match your actual repo layout.

- `thesis/` – PDF of the full thesis (final version and/or drafts).  
- `slides/` – Presentation slides for the thesis defense.  
- `sql-examples/` – Example scripts for indexed/materialized views, CTAS, statistics, and diagnostic queries.  
- `benchmarks/` – Scripts and notes related to the experimental protocol and performance measurements.

## Technologies & Tools

- **Database systems:** Microsoft SQL Server, Azure Synapse Analytics  
- **Paradigm:** Data Warehouse / OLAP  
- **Topics:** physical design, materialized views, query optimizer behavior, performance tuning  

## How to Cite

You can cite this thesis as:

```text
<Your Name>, "Advanced Query Optimization in Business Intelligence Systems",
Bachelor's Thesis, <Department>, <University>, <Year>.
