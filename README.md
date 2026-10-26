# Customer & Orders | SQL Data Cleaning

## Introduction

This is a hands-on SQL Server learning project built around two small, deliberately messy datasets: **customers** and **orders**. The aim is to inspect raw records, recognize common data-quality problems, and practice cleaning techniques without changing the original source data.

The repository documents my progress learning SQL for data analysis. It is a **work in progress**, rather than a finished production cleaning pipeline. It is kept separate from my earlier employee, department, and salary exercises.

## Project goals

- Explore the structure and contents of customer and order tables.
- Identify missing values, blank strings, extra whitespace, inconsistent text, and potential duplicates.
- Practice introductory checks for email addresses, phone numbers, and customer statuses.
- Use `case`, `trim`, `lower`, `len`, `like`, and `select into` to create a separate cleaned customer table.
- Build toward more comprehensive order cleaning and data-quality reporting as my SQL skills develop.

## Repository files

| File | Purpose |
| --- | --- |
| `01_raw_tables.sql` | Creates and populates `dbo.Customers` and `dbo.Orders` with the original intentionally messy records. |
| `02_cleaning_exercises.sql` | 37 numbered SQL cleaning and inspection exercises. |
| `03_intro_exploration.sql` | 5 numbered introductory exploration and whitespace queries. |

## Tools and techniques

**Environment:** Microsoft SQL Server and SQL Server Management Studio (SSMS).

**SQL practiced:** `select`, `where`, `count`, `distinct`, `is null`, `trim`, `lower`, `len`, `like`, `case`, and `select into`.

## How to run

1. Connect to a local SQL Server instance using SSMS.
2. Create or select a **practice database** (for example, `tutorial`). Do not run the setup in `master`.
3. Run `01_raw_tables.sql` **once** to create and populate the two raw tables.
4. Open `03_intro_exploration.sql` or `02_cleaning_exercises.sql`. **Highlight one query at a time** before pressing F5.
5. The final `select ... into customers_clean` statement creates a new table. Run it only when `customers_clean` does not already exist.

## Approach and limitations

The raw data is intentionally preserved, including its inconsistencies. Exercises are numbered for easy reference and reflect the techniques covered so far in my course.

The cleaned customer table keeps `customerid` so records can be traced back to the source and related to orders later. Some validation examples are intentionally simplified: for example, checking only `.com` addresses is **not** a complete email validator, and the phone checks are not production-grade. SQL Server string comparisons can also handle trailing spaces differently than expected.

## Next steps

- Extend the cleaning exercises to the orders table.
- Review duplicate handling and relationships between customers and orders.
- Add data-quality summaries showing issues detected and resolved.
- Refine validation rules as I learn more advanced SQL.

---

*Learning project — updated as new SQL techniques are introduced.*