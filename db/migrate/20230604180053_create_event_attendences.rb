class CreateEventAttendences < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendences do |t|
      t.references :event_attendee, null: false, foreign_key: { to_table: :users }
      t.references :attended_event, null: false, foreign_key: { to_table: :events }

      t.timestamps
    end
  end
end
