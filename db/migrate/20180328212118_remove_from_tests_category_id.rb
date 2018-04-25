class RemoveFromTestsCategoryId < ActiveRecord::Migration[5.1]
  def change
    remove_column :tests, :category_id, :integer
  end
end
