class AddTestsTitleCategoryIdNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:tests, :category_id, false)
    change_column_null(:tests, :title, false)
  end
end
