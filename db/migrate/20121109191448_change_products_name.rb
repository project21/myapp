class ChangeProductsName < ActiveRecord::Migration
  def up
  	rename_column :products, :name, :product_name
  	change_column :products, :product_name, :text
  end

  def down
  		rename_column :products, :product_name, :name
  		change_column :product_name, :product_name, :string
  end
end
