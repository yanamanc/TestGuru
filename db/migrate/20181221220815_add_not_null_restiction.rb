class AddNotNullRestiction < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    change_column_null(:users, :name, false)
    change_column_null(:users, :admin, false)
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :correct, false)
    change_column_null(:categories, :title, false)
    change_column_null(:questions, :body, false)
    change_column_null(:answers, :question, false)
    change_column_null(:questions, :test, false)
    change_column_null(:tests, :category, false)
  end
end
