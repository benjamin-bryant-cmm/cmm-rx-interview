.PHONY: install test run irb docker-build docker-test docker-run docker-irb deploy

install:
	bundle install

test:
	bundle exec rake test

run:
	bundle exec ruby server.rb

irb:
	bundle exec ruby irb.rb

docker-build:
	docker compose build

docker-test:
	docker compose run --rm app make test

docker-run:
	docker compose run --rm --service-ports app make run

docker-irb:
	docker compose run --rm app make irb

deploy:
	@echo "Deploys moved to the console. Ask in #refill-dev for the current link."
	@exit 1
