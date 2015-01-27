require_relative '../test_helper'

class SortByNameTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_user_can_sort_items_alphabetically
    item1 = create(:item)
    item2 = create(:item, name: "Apples")
    item3 = create(:item, name: "Banana")

    visit items_path

    select("alphabetically", :from => 'Filter')

    assert_equal "Apples", page.find('.name_heading:first-child').text
  end
end
