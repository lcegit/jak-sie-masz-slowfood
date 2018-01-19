Then("I would like to see {string} under {string} with a price of {string}") do |description, name, price|
  product = Product.find_by(name: name)
  within("#product-#{product.id}") do
    expect(page).to have_content "#{name} #{description} Price: #{price}"
  end
end
