CREATE TABLE pharmacies (
  id   INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  tz   TEXT NOT NULL
);

CREATE TABLE refills (
  id          INTEGER PRIMARY KEY,
  pharmacy_id INTEGER NOT NULL REFERENCES pharmacies(id),
  patient_ref TEXT NOT NULL,
  drug        TEXT NOT NULL,
  due_at      TEXT NOT NULL,
  status      TEXT NOT NULL
);
