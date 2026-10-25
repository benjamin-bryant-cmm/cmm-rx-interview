.PHONY: install test run deploy

install:
	bundle install

test:
	bundle exec rake test

run:
	bundle exec ruby server.rb

deploy:
	@echo "Deploys moved to the console. Ask in #refill-dev for the current link."
	@exit 1
