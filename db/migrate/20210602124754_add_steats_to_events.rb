class AddSteatsToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :seats, :integer, default: 0
  end
end
