class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.datetime :eventdate
      t.references :creator, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
