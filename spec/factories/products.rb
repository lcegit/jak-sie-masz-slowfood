FactoryBot.define do
  factory :product do
    restaurant
    product_category
    name "MyString"
    description "Product description"
    price 80
  end
end
