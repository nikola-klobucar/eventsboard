class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
        t.string :title
        t.text :description
        t.datetime :start_date
        t.datetime :end_date
        t.string :venue
        t.string :location

      t.timestamps
    end
  end
end
