class RemoveQuestionsTestIdNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:questions, :test_id, true)
  end
end
