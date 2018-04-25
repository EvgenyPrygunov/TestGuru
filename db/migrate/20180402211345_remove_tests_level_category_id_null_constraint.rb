class RemoveTestsLevelCategoryIdNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:tests, :level, true)
    change_column_null(:tests, :category_id, true)
  end
end
