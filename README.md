# SQL Relational Data Validation & Analytics

This repository contains a structured collection of SQL scripts that
demonstrate relational database design, data validation, and analytical
querying using simulated business-style datasets.

The project is organized into multiple SQL files, each focusing on a
specific aspect of SQL used in backend systems, QA/SDET validation, and
analytical reporting.

---

## Repository Structure

### 01_basic_and_filter_queries.sql
Covers fundamental SQL queries used to retrieve and filter data from
tables. This includes conditional filtering, pattern matching, sorting,
and basic validation checks commonly used to verify data correctness.

Key concepts:
- SELECT and DISTINCT
- WHERE conditions
- LIKE and BETWEEN
- ORDER BY
- Basic data filtering

---

### 02_joins_and_aggregations.sql
Demonstrates combining data across multiple tables using joins and
aggregation functions. These queries simulate department-wise,
project-wise, and employee-level business reporting scenarios.

Key concepts:
- INNER, LEFT, and RIGHT joins
- GROUP BY and HAVING
- COUNT, SUM, AVG
- Department and project analysis

---

### 03_relational_joins.sql
Focuses on complex relational joins across multiple entities such as
employees, departments, managers, projects, and hierarchical
relationships. Includes multi-table joins, cross joins, and self joins
to model real-world relational dependencies.

Key concepts:
- Multi-table joins
- Self joins (manager–employee, parent–child)
- CROSS JOIN usage
- Handling NULL values
- Relational integrity validation

---

### 04_window_functions.sql
Contains advanced SQL window (analytic) functions for performing
partition-based analysis without collapsing result sets. Uses employee
and product datasets to demonstrate ranking, comparison, and trend
analysis.

Key concepts:
- Aggregate window functions (MAX, MIN, SUM, AVG, COUNT)
- ROW_NUMBER, RANK, DENSE_RANK
- NTILE for segmentation
- LAG and LEAD for sequential comparison
- FIRST_VALUE and LAST_VALUE
- RANGE and ROWS frame clauses

---

## Use Case

The queries in this repository represent SQL scenarios commonly
encountered in backend data validation, QA/SDET testing, and analytical
roles, where data consistency, relationships, ranking, and trend
analysis are required.

This project emphasizes clarity, structure, and correctness in SQL
query design.

## Note:
The SQL concepts practiced in this repository were learned through
structured learning resources. The queries were implemented and
organized independently to demonstrate understanding of relational
and analytical SQL concepts.

