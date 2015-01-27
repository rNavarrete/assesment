require_relative '../test_helper'

class CustomersAlsoBoughtTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Storedom::Application
  end

  def test_a_user_can_view_other_items_bought_by_customers_who_bought_an_item
    order = create(:order)
    item1 = create(:item)
    item2 = create(:item, name: "Apples")
    item3 = create(:item, name: "Banana")
    order.items = [item1, item2, item3]

    visit item_path(item1)

    save_and_open_page

    assert page.has_content? "Apples"
    assert page.has_content? "Banana"
  end

end
