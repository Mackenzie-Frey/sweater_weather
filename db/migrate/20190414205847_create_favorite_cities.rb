class CreateFavoriteCities < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_cities do |t|
      t.references :user, foreign_key: true
      t.string :city
    end
  end
end
