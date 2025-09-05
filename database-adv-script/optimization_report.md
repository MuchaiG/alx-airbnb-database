**Objective**

- The goal was to retrieve all bookings with user details, property details, and payment details efficiently.
We started with an unoptimized query, analyzed its performance, and refactored it to improve execution time.

**Issues Identified**

- Used SELECT * pattern (retrieved unnecessary columns).

- Multiple joins without indexing → led to table scans.

- LEFT JOIN used everywhere, even where relationships are mandatory.

**Findings**

- Full table scans on bookings, users, and properties.

- High execution time for large datasets.

- Missing indexes on join/filter columns (user_id, property_id, booking_id).

**Improvements**

- Removed unnecessary columns → reduced I/O.

- Kept LEFT JOIN only for payments (since a booking may not have a payment yet).

- Relies on indexes for join keys:

   > bookings.user_id

   > bookings.property_id

   > payments.booking_id

**Results**

- Index scans instead of full table scans.

- Reduced execution time significantly.

- More scalable for production workloads.