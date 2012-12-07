class AddPublisherIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :publisher_id, :integer
  end
end
