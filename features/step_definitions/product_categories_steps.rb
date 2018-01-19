Given('the following products exist within a specific restaurant and category') do |table|
  table.hashes.each do |product|
    restaurant = Restaurant.find_by(name: product[:restaurant])

    menu = create(:menu, name: product[:menu], restaurant: restaurant)

    category = create(:product_category, name: product[:category],
                                         restaurant: restaurant,
                                         menu: menu)

    current_product = create(:product, name: product[:name],
                             product_category: category,
                             restaurant: restaurant)

    current_product.update_attribute(:price, product[:price]) if product[:price]
  end
end

Then('I would like to see {string} under the {string} category') do |product, product_category|
  product_category = ProductCategory.find_by(name: product_category)
  within("#product_category-#{product_category.id}") do
    expect(page).to(have_content(product)) && product_category.name
  end
end

Then('I would not like to see {string} under the {string} category') do |product, product_category|
  product_category = ProductCategory.find_by(name: product_category)
  within("#product_category-#{product_category.id}") do
    expect(page).not_to have_content product
  end
end
