# refill-api

Returns the refills a pharmacy needs to fill on a given date.

## Run

```
bundle install
make test
make irb
```

`make irb` opens an IRB session with the database and app code loaded. Use `conn` to run queries.

To run the server, use `make run`. It blocks, so call it from a second terminal:

```
make run
curl "localhost:8000/pharmacies/1/refills/due?date=2025-03-13"
```

Requires Ruby 3.2 or later and a C compiler for some gems.

## Docker

If you don't have Ruby set up, use Docker instead. Edits on your machine show up in the container.

```
make docker-test
make docker-run
make docker-irb
```

`make docker-run` serves on `localhost:8000`. After changing `Gemfile`, run `make docker-build`.

## Conventions

- `pharmacies.tz` is the source of truth for a pharmacy's local time. `refills.due_at` is stored in UTC.
- Invalid input returns 400, including unknown IDs. The gateway reserves 404 for unknown routes.
- Schema changes go in `db/migrations/` as numbered SQL files. Don't edit `db/schema.sql`.
- Deploy steps are in `docs/DEPLOY.md`.
