class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :post, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :favorites, :posts
    add_foreign_key :favorites, :users
  end
end
