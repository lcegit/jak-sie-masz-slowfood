Feature: User can select preferred category in order to view a relevant list of restaurants
  As a user,
  In order to see restaurants that match my preferences for tonight,
  I would like to select my preferred category and see a list of restaurants related to that category

  Background:
    Given the following categories exist
      | name            |
      | Chinese         |
      | French          |
      | Italian         |

    And the following restaurants within categories exist
      | name               | category |
      | Thomas Kebabrulle  | Chinese  |
      | Oliver's Burger    | Chinese  |
      | Borat's Palace     | French   |
      | Lisa's Bistro      | French   |
      | Franchesco's Pasta | Italian  |
      | Mama's Pizza       | Italian  |

  Scenario:
    When I visit the landing page
    Then show me the page
    Then I would like to see "Thomas Kebabrulle" in the "Chinese" category
    And I would like to see "Oliver's Burger" in the "Chinese" category
    And I would not like to see "Borat's Palace" in the "French" category
    And I would like to see "Lisa's Bistro" in the "French" category
    When I click on "French" button
    Then I would like to see "Borat's Palace" in the "French" category
    And I would like to see "Lisa's Bistro" in the "French" category
    When I click on "Italian" button
    Then I would like to see "Franchesco’s Pasta" in the "Italian" category
    And I would like to see "Mama's Pizza" in the "Italian" category
