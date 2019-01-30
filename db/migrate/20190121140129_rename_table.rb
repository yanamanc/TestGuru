class RenameTable < ActiveRecord::Migration[5.1]
  def change
  	rename_table :results, :test_passages
  end
end
