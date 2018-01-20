restaurant_category_thai = RestaurantCategory.create(name: 'Thai')
restaurant_category_italian = RestaurantCategory.create(name: 'Italian')
restaurant_category_french = RestaurantCategory.create(name: 'French')

Restaurant.create(name: 'Åsa Thai Restaurang & Take Away',
                  street_address: 'Sörviksvägen 3',
                  post_code: '439 54',
                  city: 'Åsa',
                  description: 'Really nice local thai food',
                  restaurant_category: restaurant_category_thai)

Restaurant.create(name: 'Bov',
                  street_address: 'Gibraltargatan 20',
                  post_code: '411 32',
                  city: 'Göteborg',
                  description: 'Really good pizza',
                  restaurant_category: restaurant_category_italian)

Restaurant.create(name: 'Brasserie Balzac',
                  street_address: 'Odengatan 26',
                  post_code: '113 51',
                  city: 'Stockholm',
                  description: 'With your nose up like the french',
                  restaurant_category: restaurant_category_french)
