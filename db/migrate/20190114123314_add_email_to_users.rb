class AddEmailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column(:users, :email, :string)
    add_reference(:tests, :author, foreign_key: { to_table: :users })
  end
end
