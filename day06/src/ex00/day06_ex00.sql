CREATE TABLE person_discounts (
  id bigint primary key,
  person_id bigint not null,
  pizzeria_id bigint not null,
  constraint fk_person_discount_person_id FOREIGN key (person_id) REFERENCES person(id),
  CONSTRAINT fk_person_discount_pizzeria_id FOREIGN key (pizzeria_id) REFERENCES pizzeria(id),
  discount NUMERIC
);