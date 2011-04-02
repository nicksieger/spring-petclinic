Feature: Owners

  Scenario: Owner page
    Given I am on the owners search page
    And I press "Find Owners"
    When I follow "George Franklin"
    Then I should see "Pets and Visits"
    And I should see "Leo"

  Scenario: Navigate to Add Owner
    Given I am on the owners search page
    When I follow "Add Owner"
    Then I should see "New Owner" within "h2"

  Scenario: Add New Owner
    Given I am on the new owner page
    When I fill in the following:
      | First name | Dan         |
      | Last name  | Wood        |
      | Address    | 123 Main St |
      | City       | Anywhere    |
      | Telephone  | 5555555     |
   And I press "Add Owner"
   Then I should see "Owner Information" within "h2"
   And I should see "Dan Wood"
