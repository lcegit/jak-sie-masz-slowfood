Feature: User adds products to an order
  As a user
  In order to select products I want to buy
  I would like to be able to add products to an order

  Background:
    Given the following restaurants exist
      | name              | street_address    | city     |
      | Oliver's Burger   | Kungsgatan 1      | Göteborg |

    Given the following products exist within a specific restaurant and category
      | name              | restaurant      | category    | menu       | price |
      | Chicken wings     | Oliver's Burger | Starter     | Lunch      | 45    |
      | Double Burger     | Oliver's Burger | Main Course | À la carte | 50    |

  @javascript @googlemap
  Scenario: Visitor can add a selected product to an order
    Given I visit the "Oliver's Burger" show page
    And I click on "Add to Order" for "Chicken wings"
    Then I should see "Chicken wings has been added to your order"
    And I should be on the restaurant "Oliver's Burger" page
    And an order should have been created in the database
    And "Chicken wings" should be an order item

  @javascript @googlemap
  Scenario: Visitor can add a second product to an already excisting order
    Given I visit the "Oliver's Burger" show page
    And "Chicken wings" is already in my order
    And I click on "Add to Order" for "Double Burger"
    Then I should see "Double Burger has been added to your order"
    And "Chicken wings" should be an order item
    And "Double Burger" should be an order item
