# Database Normalization to 3NF

## Step 1: First Normal Form (1NF)
- Each table has a primary key.
- All attributes contain only atomic values (no multi-valued or repeating attributes).
- Each record is unique.

✅ The schema satisfies 1NF.

---

## Step 2: Second Normal Form (2NF)
- The schema is already in 1NF.
- All non-key attributes depend on the full primary key.
- Since we are using surrogate keys (UUIDs) instead of composite keys, no partial dependency exists.

✅ The schema satisfies 2NF.

---

## Step 3: Third Normal Form (3NF)
- The schema is already in 2NF.
- All non-key attributes depend only on the primary key and not on other non-key attributes.
- Review of entities:
  - **User**: All attributes depend on `user_id`.
  - **Property**: All attributes depend on `property_id`.
  - **Booking**: Attributes depend on `booking_id`. 
    - Note: `total_price` is a derived field (price_per_night × number of nights). 
      - To maintain strict 3NF, this field should be removed and calculated dynamically. 
      - For performance reasons, it may be stored, which is a form of controlled denormalization.
  - **Payment**: All attributes depend on `payment_id`.
  - **Review**: All attributes depend on `review_id`.
  - **Message**: All attributes depend on `message_id`.

✅ The schema satisfies 3NF.  
⚠️ With one note: `total_price` in Booking may be considered a derived attribute and could be removed for full normalization.

---

## Conclusion
The database schema is normalized to **Third Normal Form (3NF)**. 
All entities and relationships are structured to minimize redundancy and prevent update anomalies. 
A single minor adjustment (removing `total_price` from Booking) is optional depending on system requirements for performance.
