class ChangeFavoriteDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column_default :restaurants, :favorite, false
  end
end
