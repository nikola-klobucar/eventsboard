class AddCategoryIdToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :category_id, :integer
    add_index :events, :category_id
  end
end
