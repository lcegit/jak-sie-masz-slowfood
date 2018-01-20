Feature: Showing restaurants on map
  As a user,
  In order to pick a restaurant,
  I would like to see them pointed out on a map

  Background:
    Given the following restaurants exist
      | name              | street_address    | city     |
      | Thomas Kebabrulle | Drottninggatan 1  | Göteborg |
      | Oliver's Burger   | Kungsgatan 1      | Göteborg |
      | Borat's Palace    | Östra Hmangatan 1 | Göteborg |

    And I am at latitude: "57.7", longitude: "11.9"

  @javascript @googlemap
  Scenario:
    When I visit the landing page
    Then I should see the map
    And I should see 4 markers
