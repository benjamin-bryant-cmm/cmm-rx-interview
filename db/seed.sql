INSERT INTO pharmacies (id, name, tz) VALUES
  (1, 'Columbus Main', 'America/New_York'),
  (2, 'Seattle Hill',  'America/Los_Angeles');

INSERT INTO refills (id, pharmacy_id, patient_ref, drug, due_at, status) VALUES
  (1, 1, 'P-1001', 'lisinopril',     '2025-03-13T14:00:00Z', 'scheduled'),
  (2, 1, 'P-1002', 'metformin',      '2025-03-14T01:30:00Z', 'scheduled'),
  (3, 1, 'P-1003', 'atorvastatin',   '2025-03-13T15:00:00Z', 'on_hold'),
  (4, 2, 'P-2001', 'amlodipine',     '2025-03-13T17:00:00Z', 'scheduled'),
  (5, 2, 'P-2002', 'levothyroxine',  '2025-03-14T02:30:00Z', 'scheduled'),
  (6, 2, 'P-2003', 'sertraline',     '2025-03-13T05:00:00Z', 'scheduled'),
  (7, 2, 'P-2004', 'omeprazole',     '2025-03-14T00:00:00Z', 'cancelled'),
  (8, 2, 'P-2005', 'warfarin',       '2025-03-13T20:00:00Z', 'on_hold');
