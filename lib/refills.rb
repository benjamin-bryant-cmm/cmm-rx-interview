module Refills
  def self.due(conn, pharmacy_id, day)
    conn.execute(
      "SELECT id, patient_ref, drug, due_at FROM refills " \
      "WHERE pharmacy_id = ? AND date(due_at) = ? AND status != 'cancelled' " \
      "ORDER BY due_at",
      [pharmacy_id, day.iso8601]
    )
  end

  # ask Priya before changing the rounding rules
  def self.round_quantity(quantity, increment = 0.5)
    (quantity / increment).round * increment
  end
end
