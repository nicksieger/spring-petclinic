Feature: Visits

  Scenario: Add a visit
    Given I am on the owners search page
    And I press "Find Owners"
    And I follow "George Franklin"
    And I follow "Add Visit"
    When I fill in "Description" with "annual checkup"
    And press "Add Visit"
    Then I should see "annual checkup"    
