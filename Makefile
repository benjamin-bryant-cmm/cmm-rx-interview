.PHONY: install test run irb deploy

install:
	bundle install

test:
	bundle exec rake test

run:
	bundle exec ruby server.rb

irb:
	bundle exec ruby irb.rb

deploy:
	@echo "Deploys moved to the console. Ask in #refill-dev for the current link."
	@exit 1
