# Code Examples for the Bachelor Thesis

This folder contains all the SQL scripts and code snippets discussed in my bachelor thesis  
**"Ottimizzazione delle Query per Sistemi di Business Intelligence: Tecniche Avanzate per Migliorare le Performance e il Supporto Decisionale"**.

The scripts are organized by platform and topic, and they are ready to be tested on a SQL Server or Azure Synapse environment.

## 📁 Folder Structure

```
code/
├── sql-server/          # Examples for Microsoft SQL Server (on‑premises or managed instance)
├── synapse/             # Examples for Azure Synapse Analytics (dedicated SQL pool)
└── etl-example/         # Miscellaneous ETL‑related snippets (some may be in .tex format)
```

---

## 🗄️ SQL Server Examples (`sql-server/`)

These scripts demonstrate the use of **indexed views**, query hints, and columnstore monitoring in SQL Server.

| File | Description | Corresponding Listing in Thesis |
|------|-------------|---------------------------------|
| `01_creazione_vista_indicizzata.sql` | Creation of an indexed view with `SCHEMABINDING` and a unique clustered index. | Listing 6.1 |
| `02_NOEXPAND_EXPAND_VIEWS.sql` | Controlling the use of indexed views with `NOEXPAND` and `EXPAND VIEWS` hints. | Listing 6.3 |
| `03_columnstore_rowgroup_stats.sql` | Query to check columnstore rowgroup quality and space usage. | Listing 6.6 |

---

## ☁️ Azure Synapse Examples (`synapse/`)

These scripts focus on **materialized views**, distribution strategies, maintenance, and TPC‑DS based evaluations in Azure Synapse.

| File | Description | Corresponding Listing in Thesis |
|------|-------------|---------------------------------|
| `01_create_materialized_view.sql` | Creating a materialized view with `HASH` distribution. | Listing 6.2 |
| `02_optimization_loop_ctas_mv.sql` | Complete OLAP optimisation cycle: CTAS, materialized views, statistics, `EXPLAIN`, and rebuild. | Listing 6.4 |
| `03_operational_cycle_explain.sql` | Operational workflow: profiling with `EXPLAIN`, validation of automatic rewrite, overhead monitoring, and comparison with result‑set cache. | Listing 6.5 |
| `04_tpcds_evaluation.sql` | Full TPC‑DS based evaluation: baseline, materialized view creation, performance KPI collection, and overhead management. | Listing 6.7 |

---

## 🔧 ETL Snippets (`etl-example/`)

This folder contains additional code fragments used in the ETL chapters. Some files are kept in `.tex` format because they were originally included as listings in the thesis. You can extract the SQL parts if needed.

| File | Description |
|------|-------------|
| `codice_A.tex` | Example of A* algorithm pseudocode (if used). |
| `codice_esempio_vista_materializzata.sql` | Sample materialized view creation (generic). |
| `codice_partizione.sql` | Table partitioning example. |

---

## 🚀 How to Use

1. Clone this repository.
2. Open the relevant `.sql` file in your preferred SQL editor (SSMS, Azure Data Studio, etc.).
3. Make sure you are connected to the correct environment (SQL Server or Azure Synapse).
4. Execute the scripts step by step, adapting database/table names if necessary.

> ⚠️ Some scripts may create or alter objects; review them carefully before running in production environments.

---

## 📌 Notes

- All scripts are provided as‑is, based on the version of SQL Server / Azure Synapse available at the time of writing (2024/2025).
- The TPC‑DS evaluation script assumes you have already created the TPC‑DS tables and loaded data (the script itself does not generate the dataset).
- For the Synapse examples, the `EXPLAIN WITH_RECOMMENDATIONS` command requires appropriate permissions.

---

If you have any questions or suggestions, feel free to open an issue or contact me directly.

**Happy query optimizing!**