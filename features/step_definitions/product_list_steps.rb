Given("the following products exist within a specific restaurant") do |table|
  table.hashes.each do |product|
    held_by_restaurant = Restaurant.find_by(name: product[:restaurant])
    menu = FactoryBot.create(:menu, name: product[:name], restaurant: held_by_restaurant)
    category = FactoryBot.create(:product_category, name: product[:category], restaurant: held_by_restaurant, menu: menu)
    FactoryBot.create(:product,
                      name: product[:name],
                      description: product[:description],
                      restaurant: held_by_restaurant,
                      product_category: category,
                      price: product[:price].to_f)
  end
end

When("I visit the {string} show page") do |restaurant_name|
  restaurant = Restaurant.find_by(name: restaurant_name)
  visit restaurant_path(restaurant)
end
