# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

restaurant_category_thai = RestaurantCategory.create(name: 'Thai')
restaurant_category_thai = RestaurantCategory.create(name: 'Thai')

Restaurant.create(name: 'Åsa Thai Restaurang & Take Away',
                  street_address: 'Sörviksvägen 3',
                  post_code: '439 54',
                  city: 'Åsa',
                  description: 'Really',
                  restaurant_category: restaurant_category_thai)
