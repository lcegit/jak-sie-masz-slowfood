@javascript
Feature: User can view nearby restaurants as markers on a map
  As a user,
  In order to see nearest restaurants,
  I would like to see restaurants pinned out on a map

  Background:
    Given the following restaurants exist
    | name              | street_address    | city     |
    | Thomas Kebabrulle | Drottninggatan 1  | Göteborg |
    | Oliver's Burger   | Kungsgatan 1      | Göteborg |
    | Borat's Palace    | Östra Hmangatan 1 | Göteborg |

    And the following restaurants within categories exist
      | name              | street_address   | city      | category | description   |
      | Thomas Kebabrulle | Drottninggatan 1 | Göteborg  | Chinese  | Food is tasty |
      | Oliver's Burger   | Kungsgatan 1     | Göteborg  | Chinese  | Food is tasty |
      | Borat's Palace    | Östra Hmangatan 1| Göteborg  | Italian  | Food is tasty |

    And I am at latitude: "57.7096369", longitude: "11.9661792"

  @googlemap
  Scenario:
    When I visit the landing page
    And the map has been loaded
    Then show me the page
    Then the center of the map should be approximately "57.7096" lat and "11.9661" lng
    And I should see 3 markers
