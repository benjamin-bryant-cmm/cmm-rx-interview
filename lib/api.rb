# frozen_string_literal: true

require 'date'
require_relative 'refills'

module Api
  ROUTE = %r{\A/pharmacies/(\d+)/refills/due\z}

  # Returns [status, body] for GET requests. `query` is a hash of strings.
  def self.handle_request(conn, path, query)
    match = ROUTE.match(path)
    return [404, { error: 'route not found' }] unless match

    begin
      day = Date.strptime(query.fetch('date', ''), '%Y-%m-%d')
    rescue Date::Error
      return [400, { error: 'date must be YYYY-MM-DD' }]
    end

    pharmacy_id = match[1].to_i
    [200, {
      pharmacy_id: pharmacy_id,
      date: day.iso8601,
      refills: Refills.due(conn, pharmacy_id, day)
    }]
  end
end
