FactoryBot.define do
  factory :product do
    restaurant
    product_category
    name "MyString"
    description "Product description"
    price 80
    image_file_link "http://www.example.com/image.jpg"
  end
end
