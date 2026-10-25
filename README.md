# refill-api

Returns the refills a pharmacy needs to fill on a given date.

## Run

```
bundle install
make test
make run
curl "localhost:8000/pharmacies/1/refills/due?date=2025-03-13"
```

Requires Ruby 3.2 or later.

## Conventions

- `pharmacies.tz` is the source of truth for a pharmacy's local time. `refills.due_at` is stored in UTC.
- Invalid input returns 400, including unknown IDs. The gateway reserves 404 for unknown routes.
- Schema changes go in `db/migrations/` as numbered SQL files. Don't edit `db/schema.sql`.
- Deploy steps are in `docs/DEPLOY.md`.
