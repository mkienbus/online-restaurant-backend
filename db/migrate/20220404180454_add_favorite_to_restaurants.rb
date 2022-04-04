class AddFavoriteToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :favorite, :boolean
  end
end
