class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :content
      t.time :time
      t.date :date

      t.timestamps
    end
  end
end
