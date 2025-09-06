**Queries Monitored**

- Bookings by date + status

- Reviews per property

- Properties by location + price

**Bottlenecks Found**

- Bookings query → full table scan due to filters on multiple columns.

- Reviews query → slow lookup due to missing property_id index.

- Properties query → inefficient filtering on location + pricepernight.

**Schema Refinements**

- Added multi-column index (status, start_date, end_date) on bookings.

- Added index (property_id, user_id) on reviews.

- Added composite index (location, pricepernight) on properties.

**Improvements Observed**

- Bookings query execution time reduced from seconds → milliseconds.

- Reviews query now uses index, avoiding full scan.

- Properties search improved significantly for large datasets.