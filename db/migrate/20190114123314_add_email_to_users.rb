class AddEmailToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column(:users, :email, :string)
    add_column(:answers, :correct, :boolean)
  end
end