class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.belongs_to :user
      t.belongs_to :restaurant

      t.timestamps
    end
  end
end
