class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  def also_purchased
    #find orders that include this item
    all_items = Order.all.map do |order|
      order.items
    end

    items_with_self = all_items.select do |group|
      group.include? self
    end

    results = items_with_self.flatten!

    final = results.uniq - [self]

    final.map { |item|  item.name}
    # results = Order.all.find_all do |order|
    #   order.order_items.each do |order_items|
    #     order_items == self
    #   end
    # end
    #then return all other items from this order
  end
end