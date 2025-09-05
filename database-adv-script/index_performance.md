**Identify high-usage columns**

Users: email (unique lookup), role (filters), user_id (joins).

Properties: property_id (joins), host_id (joins), location (search/filter).

Bookings: booking_id (joins), user_id, property_id, status, start_date (filter by date range).

Reviews & Messages (optional, but also benefit): property_id, user_id, sender_id, recipient_id.
