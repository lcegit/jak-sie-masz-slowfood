Feature: User can see product description on the restaurant show page
  As a user
  In order to get more information of the product
  I would like to see a description

  Background:
    Given the following restaurants exist
      | name              | street_address    | city     |
      | Thomas Kebabrulle | Drottninggatan 1  | Göteborg |
      | Oliver's Burger   | Kungsgatan 1      | Göteborg |
      | Borat's Palace    | Östra Hmangatan 1 | Göteborg |

    Given the following products exist within a specific restaurant
      | name          | restaurant      | description      | price | category    | menu  |
      | Chicken wings | Oliver's Burger | Nice wings       | 50    | Starter     | Lunch |
      | Double Burger | Oliver's Burger | Tasty fat burger | 150   | Main Course | Lunch |
      | Apple pie     | Oliver's Burger | Sweet pie        | 65    | Dessert     | Lunch |

  @googlemap
  Scenario:
    When I visit the "Oliver's Burger" show page
    Then I would like to see "Nice wings" under "Chicken wings" with a price of "50.0 kr"
    And I would like to see "Tasty fat burger" under "Double Burger" with a price of "150.0 kr"
    And I would like to see "Sweet pie" under "Apple pie" with a price of "65.0 kr"
