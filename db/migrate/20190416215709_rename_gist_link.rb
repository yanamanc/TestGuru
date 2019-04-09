class RenameGistLink < ActiveRecord::Migration[5.1]
  def change
  	rename_column :gists, :gist_link, :url
  end
end
