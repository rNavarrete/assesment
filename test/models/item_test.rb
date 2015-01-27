require_relative '../test_helper'

class ItemTest < ActiveSupport::TestCase
  def test_it_returns_other_items_in_the_same_order
    order = create(:order)
    item1 = create(:item)
    item2 = create(:item, name: "Apples")
    item3 = create(:item, name: "Banana")
    order.items = [item1, item2, item3]

    assert_equal ["Apples", "Banana"], item1.also_purchased

  end
end
