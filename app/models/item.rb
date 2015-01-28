class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  def all_items
  end 

  def also_purchased
    all_items = Order.all.map do |order|
      order.items
    end

    items_with_self = all_items.select do |group|
      group.include? self
    end

    results = items_with_self.flatten!

    final = results.uniq - [self]

    final.map { |item|  item.name}

  end
end
