
-- USERS

INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(UUID(), 'Alice', 'Gikonyo', 'alice@example.com', 'hashed_password_1', '0712345678', 'guest'),
(UUID(), 'Bob', 'Mutheu', 'bob@example.com', 'hashed_password_2', '0723456789', 'host'),
(UUID(), 'Clara', 'Wairimu', 'clara@example.com', 'hashed_password_3', '0734567890', 'guest'),
(UUID(), 'David', 'Kimani', 'david@example.com', 'hashed_password_4', '0745678901', 'admin');


-- PROPERTIES

INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
(UUID(), (SELECT user_id FROM users WHERE email='bob@example.com'),
 'Cozy Cottage', 'A quiet countryside cottage with 2 bedrooms.', 'Nairobi, Kenya', 50.00),
(UUID(), (SELECT user_id FROM users WHERE email='bob@example.com'),
 'Beachfront Villa', 'Luxury villa with ocean view and pool.', 'Mombasa, Kenya', 200.00);


-- BOOKINGS

INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(UUID(),
 (SELECT property_id FROM properties WHERE name='Cozy Cottage'),
 (SELECT user_id FROM users WHERE email='alice@example.com'),
 '2025-09-10', '2025-09-12', 100.00, 'confirmed'),

(UUID(),
 (SELECT property_id FROM properties WHERE name='Beachfront Villa'),
 (SELECT user_id FROM users WHERE email='clara@example.com'),
 '2025-09-15', '2025-09-18', 600.00, 'pending');


-- PAYMENTS

INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
(UUID(),
 (SELECT booking_id FROM bookings WHERE status='confirmed' LIMIT 1),
 100.00, 'credit_card');


-- REVIEWS

INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
(UUID(),
 (SELECT property_id FROM properties WHERE name='Cozy Cottage'),
 (SELECT user_id FROM users WHERE email='alice@example.com'),
 5, 'Amazing stay! Very cozy and clean.'),

(UUID(),
 (SELECT property_id FROM properties WHERE name='Beachfront Villa'),
 (SELECT user_id FROM users WHERE email='clara@example.com'),
 4, 'Beautiful villa, but the WiFi could be better.');


-- MESSAGES

INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
(UUID(),
 (SELECT user_id FROM users WHERE email='alice@example.com'),
 (SELECT user_id FROM users WHERE email='bob@example.com'),
 'Hi Bob, is the Cozy Cottage available for next weekend?'),

(UUID(),
 (SELECT user_id FROM users WHERE email='bob@example.com'),
 (SELECT user_id FROM users WHERE email='alice@example.com'),
 'Hi Alice, yes it is available. Looking forward to hosting you!');
