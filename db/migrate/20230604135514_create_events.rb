class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :location
      t.datetime :date_time
      t.references :creator, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
