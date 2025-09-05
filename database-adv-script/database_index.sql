-- CREATE INDEXES
-- User table indexes
CREATE UNIQUE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);

-- Property table indexes
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);

-- Booking table indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Review table indexes
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);

-- Message table indexes
CREATE INDEX idx_messages_sender_id ON messages(sender_id);
CREATE INDEX idx_messages_recipient_id ON messages(recipient_id);


-- Performance Measurement with EXPLAIN ANALYZE

-- Check booking lookup by user
EXPLAIN ANALYZE 
SELECT * 
FROM bookings 
WHERE user_id = 'some-uuid';

-- Check booking lookup by property
EXPLAIN ANALYZE 
SELECT * 
FROM bookings 
WHERE property_id = 'some-uuid';

-- Check property search by location
EXPLAIN ANALYZE 
SELECT * 
FROM properties 
WHERE location = 'Nairobi';

-- Check user lookup by email
EXPLAIN ANALYZE 
SELECT * 
FROM users 
WHERE email = 'sample@example.com';
