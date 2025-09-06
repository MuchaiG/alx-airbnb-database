**Objective**

The bookings table is expected to grow very large over time. Queries filtering by date (e.g. bookings in a given year) became slow.

I have applied table partitioning on start_date to optimize performance.

**Implementation**

Used RANGE partitioning by YEAR(start_date).

Created separate partitions:

  - p2023 → bookings before 2024

  - p2024 → bookings in 2024

  - p2025 → bookings in 2025

  - pmax → future years


**Observed Improvements**

- Query execution time dropped significantly because MySQL only scanned the relevant partition.

- Reduced I/O load on the database.

- Makes archiving old data easier (drop old partitions without affecting current data).