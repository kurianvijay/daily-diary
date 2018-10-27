CREATE TABLE Users(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(60),
  password VARCHAR(140)
);
