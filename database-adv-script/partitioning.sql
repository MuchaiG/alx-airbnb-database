
-- Step 1: Drop table if exists (safety for testing)
DROP TABLE IF EXISTS bookings;


-- Step 2: Recreate Bookings table with RANGE partitioning by YEAR(start_date)

CREATE TABLE bookings (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    KEY idx_property_id (property_id),
    KEY idx_user_id (user_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax   VALUES LESS THAN MAXVALUE
);


-- Step 3: Example query without partitioning
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';


-- Step 4: Example query on partitioned table

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';

CREATE TABLE bookings (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    KEY idx_property_id (property_id),
    KEY idx_user_id (user_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax   VALUES LESS THAN MAXVALUE
);


-- Step 3: Query without partitioning

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';


-- Step 4: Query on partitioned table

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
