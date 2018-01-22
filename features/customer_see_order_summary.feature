Feature: Customer can see a summary of their order and total price
  As a customer
  In order to see what I have ordered and a total price
  I would like be able to see a summary on an order details page

  Background:
    Given the following restaurants exist
    | name              | street_address    | city     |
    | Oliver's Burger   | Kungsgatan 1      | Göteborg |

    Given the following products exist within a specific restaurant
    | name          | restaurant      | description      | category    | price |
    | Chicken wings | Oliver's Burger | Nice wings       | Starter     | 45    |
    | Double Burger | Oliver's Burger | Tasty fat burger | Main Course | 50    |

    Given I visit the "Oliver's Burger" show page

    Given the following order items exist in the order:
    | name          |
    | Chicken wings |
    | Double Burger |

  @googlemap @javascript
  Scenario: Customer can access order page to see order summary and total price
    Given I visit the landing page
    And I click on "Order" link
    Then I should see "Order Summary"
    And I should see "Chicken wings 45.0 kr"
    And I should see "Double Burger 50.0 kr"
    And I should see "Total: 95.00 kr"
