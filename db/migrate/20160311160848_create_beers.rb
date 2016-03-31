class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.text :description
      t.string :brewery
      t.string :image_id
      t.float :abv

      t.timestamps null: false
    end
  end
end
