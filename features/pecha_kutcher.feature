Feature: I can moderate Pecha Kucha night at Makers
  As a boss
  In order to boss
  I can boss

  Scenario: Adding a participant
    Given I am on the homepage
    When I fill in "name" with "Tim"
    And I fill in "subject" with "Lewisham"
    And I press "Add"
    Then I see "Thanks Tim, looking forward to your chatter"

  Scenario: Finding out who the next speaker is
    Given I am on the homepage
    When I click the "Who's Next?" link
    Then I am redirected to the "next" page
    Then I see "No more entrants"