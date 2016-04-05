class AddPhotoCreditToBeer < ActiveRecord::Migration
  def change
    add_column :beers, :photo_credit_site, :string
    add_column :beers, :photo_credit_site_url, :string
  end
end
