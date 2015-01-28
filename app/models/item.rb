class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  def all_items
  end

  def also_purchased
    items_for_all_orders = Order.all.map do |order|
      order.items.pluck(:name)
    end

    items_in_orders_with_self =
    items_for_all_orders.select do |group|
      group.include? self.name
    end.flatten!-[self.name]

  end


end
