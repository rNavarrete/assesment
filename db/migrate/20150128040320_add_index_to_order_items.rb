class AddIndexToOrderItems < ActiveRecord::Migration
  def change
    add_index :order_items, :item_id
    add_index :order_items, :order_id

  end
end
