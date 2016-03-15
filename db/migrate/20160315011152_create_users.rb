class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :location
      t.string :image_url
      t.boolean :admin, null: false, default: false

      t.timestamps null: false
    end
  end
end
