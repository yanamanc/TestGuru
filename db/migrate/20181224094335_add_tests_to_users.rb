class AddTestsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :test, foreign_key: true
  end
end
