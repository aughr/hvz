Feature: Manage games
  In order to moderate HvZ games
  as a moderator
  I want the ability to manage games

  Scenario: Register new game
    Given I have signed in with "mod@mod.com/test"
    And I am on the new game page
    When I fill in "Name" with "Humans vs. Zombies 11S"
    And I press "Create"
    Then I should see "Humans vs. Zombies 11S" within "h1"

  Scenario: Set the game times
    Given I have signed in with "mod@mod.com/test"
    And I have a game named "My game"
    And I am on the games page
    When I follow "My game"
    And I follow "Edit"
    And I fill in "Starts at" with "2011/01/03 9:00 AM"
    And I fill in "Ends at" with "2011/01/05 10:00 PM"
    And I press "Update"
    Then I should see "January 3, 2011, at 9:00 am" within "#starts-at"
    And I should see "January 5, 2011, at 10:00 pm" within "#ends-at"

  Scenario: Seeing my games
    Given I have signed in with "mod@mod.com/test"
    And I have a game named "My game"
    And a game named "Someone else's game" exists
    When I go to the games page
    Then I should see "My game"
    But I should not see "Someone else's game"
