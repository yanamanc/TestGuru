class AddDefaultValuesToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:users, :name, from: nil, to: "")
    change_column_default(:users, :created_at, from: nil, to: 01-01-2019)
    change_column_default(:users, :updated_at, from: nil, to: 01-01-2019)
    change_column_default(:users, :admin, from: nil, to: false)
  end
end
