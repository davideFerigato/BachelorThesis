# Query Optimization for Business Intelligence Systems: Advanced Techniques to Improve Performance and Decision Support

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
![GitHub last commit](https://img.shields.io/github/last-commit/DavideFerigato/BachelorThesis)
![LaTeX](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)
![SQL Server](https://img.shields.io/badge/SQL%20Server-2019-CC2927?logo=microsoft-sql-server)
![Azure Synapse](https://img.shields.io/badge/Azure%20Synapse-Analytics-0078D4?logo=microsoft-azure)

**Author**: Davide Maria Ferigato  
**Supervisor**: Prof. Domenico Beneventano  
**University**: University of Modena and Reggio Emilia, Department of Engineering "Enzo Ferrari"  
**Degree**: Bachelor's Degree in Computer Engineering (L-08)  
**Academic Year**: 2024/2025  

This repository contains the complete project for my bachelor's thesis, which addresses the topic of **query performance optimization in Business Intelligence systems**. The work analyzes the impact of ETL process evolution, physical design techniques (indexing, partitioning, compression, caching), and the implementation of **materialized views** on Microsoft platforms (SQL Server and Azure Synapse).

> *"A ship in port is safe, but that's not what ships are built for."* — Grace Murray Hopper

## 📥 Direct Download

- 📄 **Thesis (full PDF)**: [thesis.pdf](thesis.pdf)
- 📊 **Presentation slides**: [presentation/slides.pdf](presentation/slides.pdf)

## 📋 Table of Contents

- [Abstract](#abstract)
- [Repository Structure](#repository-structure)
- [Technologies Used](#technologies-used)
- [Code Examples](#code-examples)
- [How to Compile the Thesis (LaTeX)](#how-to-compile-the-thesis-latex)
- [License](#license)
- [Contact](#contact)

## 📄 Abstract

This thesis analyzes advanced techniques for query optimization in Business Intelligence systems, considering Data Warehouse and ETL architectures. The work integrates theory and practice: from physical design (indexing, partitioning, compression, caching) to view materialization, up to measurable performance metrics and governance. The goal is to define reproducible procedures to reduce latency and I/O while preserving data quality and freshness.

The discussion follows a progressive path: fundamentals of BI and OLTP/OLAP differences, ETL quality and structural metrics, physical design choices for analytical workloads, and the role of materialized views in reducing query costs. The applicative chapter analyzes SQL Server and Azure Synapse: creation requirements, automatic query rewrite, data distribution, statistics, use of CTAS and temporary tables, diagnostic tools, and overhead management.

The results converge into operational guidelines: columnstore and partitioning as a physical base, views designed on shared joins and aggregations with consistent distribution, validation through automatic rewrite, and overhead thresholds for rebuild. Overall, the coordinated adoption of these techniques stably reduces latencies and improves the overall efficiency of the Data Warehouse, providing applicable and replicable guidelines.

## 🗂️ Repository Structure

The structure follows a standard LaTeX project organization, with separate chapters and supplementary materials logically organized.

```
├── main.tex                                    # Main LaTeX file
├── main.bib                                     # Bibliography
├── thesis.pdf                                    # Thesis in PDF format (final version)
├── .gitignore                                    # Git ignore file
├── LICENSE                                       # MIT License
│
├── chapters/                                     # Thesis chapters (included by main.tex)
│   ├── Abstract.tex
│   ├── introduction.tex
│   ├── Fondamenti_della_Business_Intelligence_e_Data_Warehouse.tex
│   ├── Evoluzione_e_Qualità_dei_Processi_ETL.tex
│   ├── Viste_Materializzate.tex
│   ├── Ottimizzazione_Fisica_del_Data_Warehouse.tex
│   ├── Viste_materializzate_OLAP_su_SQL_Server_e_Synapse.tex
│   └── conclusion.tex
│
├── adds/                                         # Supplementary materials (images, snippets, tables)
│   ├── cover-page/                               # Cover images
│   ├── Evoluzione_e_Qualità_dei_Processi_ETL/    # ETL chapter assets
│   ├── Fondamenti_della_Business_Intelligence_e_Data_Warehouse/
│   ├── Ottimizzazione_Fisica_del_Data_Warehouse/
│   ├── Viste_Materializzate/
│   └── Viste_materializzate_OLAP_su_SQL_Server_e_Synapse/
│
├── code/                                          # All SQL scripts and code examples
│   ├── sql-server/                                 # SQL Server examples
│   ├── synapse/                                    # Azure Synapse examples
│   ├── etl-example/                                # ETL-related snippets
│   └── README.md                                   # Detailed code documentation
│
└── presentation/                                  # Defense materials
    └── slides.pdf                                  # Presentation slides
```

## 💻 Technologies Used

- **Databases & Data Warehousing:** Microsoft SQL Server 2019, Azure Synapse Analytics (Dedicated SQL Pool)
- **Languages:** T-SQL, LaTeX
- **Key Concepts:** Data Warehousing, Dimensional Modeling, ETL, Materialized Views (Indexed Views / Materialized Views), Query Optimization, OLAP, Columnstore Indexes, Partitioning, Compression, Caching, Query Hints (NOEXPAND/EXPAND VIEWS), CTAS, TPC-DS Benchmark
- **Tools:** Overleaf, SQL Server Management Studio (SSMS), Azure Data Studio, Git

## 🔍 Code Examples

All SQL scripts discussed in the thesis are available in the [`code/`](code/) folder, organized by platform. Each script is commented and ready to run in a suitable environment.

| Platform | Focus Area | Key Scripts |
|----------|------------|-------------|
| **SQL Server** | Indexed Views, Query Hints, Columnstore Monitoring | [`01_creazione_vista_indicizzata.sql`](code/sql-server/01_creazione_vista_indicizzata.sql)<br>[`02_NOEXPAND_EXPAND_VIEWS.sql`](code/sql-server/02_NOEXPAND_EXPAND_VIEWS.sql)<br>[`03_columnstore_rowgroup_stats.sql`](code/sql-server/03_columnstore_rowgroup_stats.sql) |
| **Azure Synapse** | Materialized Views, CTAS, Optimization Cycle, TPC-DS Evaluation | [`01_create_materialized_view.sql`](code/synapse/01_create_materialized_view.sql)<br>[`02_optimization_loop_ctas_mv.sql`](code/synapse/02_optimization_loop_ctas_mv.sql)<br>[`03_operational_cycle_explain.sql`](code/synapse/03_operational_cycle_explain.sql)<br>[`04_tpcds_evaluation.sql`](code/synapse/04_tpcds_evaluation.sql) |
| **ETL Examples** | Miscellaneous snippets | [`codice_partizione.sql`](code/etl-example/codice_partizione.sql) |

For a detailed description of each script and instructions on how to use them, please refer to the [`code/README.md`](code/README.md) file.

## 🚀 How to Compile the Thesis (LaTeX)

To compile the thesis locally and generate the PDF:

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

Alternatively, you can import the entire folder into [Overleaf](https://www.overleaf.com) and compile online (make sure to also upload the `chapters/` and `adds/` folders).

## 📜 License

The source code in this repository is distributed under the MIT License.  
The thesis text is copyright © 2025 Davide Maria Ferigato. All rights reserved.

## 📧 Contact

**Davide Maria Ferigato**

- **GitHub:** [@DavideFerigato](https://github.com/DavideFerigato)

---

⭐ If you find this project interesting or useful, please leave a star!
