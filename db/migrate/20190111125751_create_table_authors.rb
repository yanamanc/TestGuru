class CreateTableAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false

      t.timestamps
    end
  end
end
