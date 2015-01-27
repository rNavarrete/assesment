FactoryGirl.define do
  factory :item do
    name "oranges"
    description "sweet"
  end

  factory :order do
    amount 2.5
  end

  factory :order_item do
  end
end