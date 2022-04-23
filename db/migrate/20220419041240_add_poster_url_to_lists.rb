class AddPosterUrlToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :poster_url, :string
  end
end
