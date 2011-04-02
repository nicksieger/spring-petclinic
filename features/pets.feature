Feature: Pets

  Scenario: Add New Pet
    Given I am on the owners search page
    And I press "Find Owners"
    And I follow "George Franklin"
    And I follow "Add New Pet"
    When I fill in "name" with "Lizzie"
    And I select "lizard" from "type"
    And I fill in "birthDate" with "2011-04-01" if present
    And press "Add Pet"
    Then I should see "Owner Information"
    And I should see "George Franklin"
    And I should see "Lizzie"
    And I should see "lizard"
    
