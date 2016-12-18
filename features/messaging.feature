Feature: Messaging
  As a logged in user I want to message other users

  Background:
    Given I have sample users

  @javascript
    Scenario: User composes message
      Given "Barvis" is premium
      Given I am logged in as "Barvis"
      And I visit the profile page for user "mavis"
      When I click "Message me"
      And I fill in "message_body" with "Hi Mavis, I am Barvis"
      And I click "Add Reply"
    And Sleep 4
    And I visit "root"
    Then I should have sent a message
