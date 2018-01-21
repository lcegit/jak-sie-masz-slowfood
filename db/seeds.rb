restaurant_category_thai = RestaurantCategory.create(name: 'Thai')
restaurant_category_italian = RestaurantCategory.create(name: 'Italian')
restaurant_category_french = RestaurantCategory.create(name: 'French')

Restaurant.create(name: 'Åsa Thai Restaurang & Take Away',
                  street_address: 'Sörviksvägen 3',
                  post_code: '439 54',
                  city: 'Åsa',
                  description: 'Really nice local thai food',
                  restaurant_category: restaurant_category_thai)

Restaurant.create(name: 'Åsa La Pizza',
                  street_address: ' Varbergsvägen',
                  post_code: '439 54',
                  city: 'Åsa',
                  description: 'The local´s place for pizza',
                  restaurant_category: restaurant_category_italian)

restaurant_bov = Restaurant.create(name: 'Bov',
                                   street_address: 'Gibraltargatan 20',
                                   post_code: '411 32',
                                   city: 'Göteborg',
                                   description: 'Really good pizza',
                                   restaurant_category: restaurant_category_italian)

restaurant_balzac = Restaurant.create(name: 'Brasserie Balzac',
                                      street_address: 'Odengatan 26',
                                      post_code: '113 51',
                                      city: 'Stockholm',
                                      description: 'With your nose up like the french',
                                      restaurant_category: restaurant_category_french)

menu_lunch = Menu.create(name: 'Lunch', restaurant: restaurant_bov)

menu_dinner = Menu.create(name: 'Dinner', restaurant: restaurant_bov)

menu_dejeuner = Menu.create(name: 'Déjeuner', restaurant: restaurant_balzac)

menu_diner = Menu.create(name: 'Diner', restaurant: restaurant_balzac)

product_category_pizza = ProductCategory.create(name: 'Pizza',
                                                restaurant: restaurant_bov,
                                                menu: menu_lunch)

product_category_secondi = ProductCategory.create(name: 'Secondi',
                                                  restaurant: restaurant_bov,
                                                  menu: menu_dinner)

product_category_entree = ProductCategory.create(name: 'Entrée',
                                                 restaurant: restaurant_balzac,
                                                 menu: menu_dejeuner)

product_category_main = ProductCategory.create(name: 'Main',
                                               restaurant: restaurant_balzac,
                                               menu: menu_diner)

Product.create(name: 'Margherita',
               description: 'Classic napoletan pizza,without pineapples',
               price: 80.000,
               restaurant: restaurant_bov,
               product_category: product_category_pizza)

Product.create(name: 'Bistecca alla fiorentina',
               description: 'Some Chianina directly from Tuscany',
               price: 80.000,
               restaurant: restaurant_bov,
               product_category: product_category_secondi)

Product.create(name: 'Voulevant',
               description: 'Freshly baked, filled with icelandic salmon',
               price: 50.500,
               restaurant: restaurant_balzac,
               product_category: product_category_entree)

Product.create(name: 'Ratatouille',
               description: 'Like the movie but better',
               price: 50.500,
               restaurant: restaurant_balzac,
               product_category: product_category_main)
