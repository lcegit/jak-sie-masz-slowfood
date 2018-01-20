Given('the following categories exist') do |table|
  table.hashes.each do |restaurant_category|
    create(:restaurant_category, restaurant_category)
  end
end

Given('the following restaurants within categories exist') do |table|
  table.hashes.each do |restaurant|
    category = RestaurantCategory.find_by(name: restaurant[:category])
    create(:restaurant,
           name: restaurant[:name],
           description: restaurant[:description],
           restaurant_category: category,
           street_address: restaurant[:street_address],
           city: restaurant[:city])
  end
end

Given('the following restaurants exist') do |table|
  table.hashes.each do |restaurant|
    create(:restaurant, restaurant)
  end
end

Then('I would like to see {string} in the {string} category') do |_restaurant_name, category_name|
  within "#restaurant-category-#{category_name.downcase}" do
    expect(page).to have_content category_name
  end
end

Then('I would not like to see {string} in the {string} category') do |restaurant_name, category_name|
  within "#restaurant-category-#{category_name.downcase}" do
    expect(page).not_to have_content restaurant_name
  end
end

Then('I should be on the {string} show page') do |restaurant_name|
  restaurant = Restaurant.find_by(name: restaurant_name)
  expect(current_path).to eq restaurant_path(restaurant)
end

Then('I would not like to see {string}') do |content|
  expect(page).not_to have_content(content)
end
