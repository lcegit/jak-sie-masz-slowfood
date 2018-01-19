And("I click on {string} for {string}") do |button, product_name|
  product = Product.find_by(name: product_name)
  within "#product-#{product.id}" do
    click_link_or_button button
  end
end

Then("I should see {string}") do |content|
  expect(page).to have_content content
end

Then("I should be on the restaurant {string} page") do |restaurant_name|
  restaurant = Restaurant.find_by(name: restaurant_name)
  expect(current_path).to eq restaurant_path(restaurant)
end

Then("an order should have been created in the database") do
  @order = Order.last
  expect(@order).not_to be nil
end
#

And(/^"([^"]*)" is already in my order$/) do |product_name|
  steps %Q{
   And I click on "Add to Order" for "#{product_name}"
   Then I should see "#{product_name} has been added to your order"
   And I should be on the restaurant "Oliver's Burger" page
        }
end

Then("{string} should be an order item") do |product_name|
  @order = @order || Order.last
  items_collection = @order.order_items.map{ |product| product.item.name }
  expect(items_collection).to include product_name
end
