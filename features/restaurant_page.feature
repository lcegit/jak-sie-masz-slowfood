@javascript
Feature: User can see restaurant's details on the restaurant show page
  As a user
  In order to get info about the restaurant
  I would like to see restaurant details

  Background:
    Given the following categories exist
      | name    |
      | Chinese |
      | French  |
      | Italian |

    Given the following restaurants within categories exist
    | name              | street_address    | city     | description                     | category |
    | Thomas Kebabrulle | Drottninggatan 1  | Göteborg | The best kebabrulle you can get | Chinese  |
    | Oliver's Burger   | Kungsgatan 1      | Göteborg | The best hamburger you can get  | French   |
    | Borat's Palace    | Östra Hmangatan 1 | Göteborg | The best borat you can get      | Italian  |

    And I am at latitude: "57.7", longitude: "11.9"

  @googlemap
  Scenario: User can navigate to selected restaurant page
    When I visit the landing page
    And I click on "Thomas Kebabrulle" link
    Then I should be on the "Thomas Kebabrulle" show page
    Then I would like to see "Thomas Kebabrulle"
    And I would like to see "The best kebabrulle you can get"
