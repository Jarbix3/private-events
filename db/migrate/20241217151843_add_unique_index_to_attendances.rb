class AddUniqueIndexToAttendances < ActiveRecord::Migration[8.0]
  def change
    add_index :attendances, [ :attendee_id, :attended_event_id ], unique: true
  end
end
