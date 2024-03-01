COMMENT ON TABLE person_discounts IS 'Table contains discounts for each client who ordered pizza';
COMMENT ON COLUMN person_discounts.id IS 'Primary key';
COMMENT ON COLUMN person_discounts.person_id IS 'Key to person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Key to pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'Discount for client in pizzeria';