@javascript @googlemap
Feature: Customer can pay for order
  As a customer
  In order to complete my purchase
  I need to be able to fill in a stripe payment form

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


  Scenario: User can perform transaction
    Given I click on "Order" link
    And I click on "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4242 4242 4242 4242"
    And I fill in stripe form field "MM / YY" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should be redirected to "order" page

  Scenario: Users card number is incorrect
    Given I click on "Order" link
    And I click on "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4242 4242 4242 4241"
    And I fill in stripe form field "MM / YY" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should not be redirected to order page

  Scenario: Users card has expired
    Given I click on "Order" link
    And I click on "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4000 0000 0000 0069"
    And I fill in stripe form field "MM / YY" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should not be redirected to order page

  Scenario: Users card cvc is incorrect
    Given I click on "Order" link
    And I click on "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4000 0000 0000 0127"
    And I fill in stripe form field "MM / YY" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should not be redirected to order page

  Scenario: Processing error
    Given I click on "Order" link
    And I click on "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4000 0000 0000 0119"
    And I fill in stripe form field "MM / YY" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should not be redirected to order page

  Scenario: Users card is declined
    Given I click on "Order" link
    And I click on "Pay with Card" button
    And I fill in stripe form field "Email" with "random@random.com"
    And I fill in stripe form field "Card number" with "4000 0000 0000 0002"
    And I fill in stripe form field "MM / YY" with "12/2021"
    And I fill in stripe form field "CVC" with "123"
    And I submit the stripe form
    Then I should not be redirected to order page
