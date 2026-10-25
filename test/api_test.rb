require "minitest/autorun"
require_relative "../lib/api"
require_relative "../lib/db"

class DueRefillsTest < Minitest::Test
  def setup
    @conn = Db.connect
  end

  def drugs(body)
    body[:refills].map { |r| r["drug"] }
  end

  def test_returns_due_refills_for_midday_date
    status, body = Api.handle_request(@conn, "/pharmacies/1/refills/due", { "date" => "2025-03-13" })
    assert_equal 200, status
    assert_includes drugs(body), "lisinopril"
  end

  def test_excludes_cancelled_refills
    _, body = Api.handle_request(@conn, "/pharmacies/2/refills/due", { "date" => "2025-03-14" })
    refute_includes drugs(body), "omeprazole"
  end

  def test_rejects_bad_date
    status, = Api.handle_request(@conn, "/pharmacies/1/refills/due", { "date" => "03/13/2025" })
    assert_equal 400, status
  end

  def test_unknown_route_is_404
    status, = Api.handle_request(@conn, "/nope", {})
    assert_equal 404, status
  end
end
