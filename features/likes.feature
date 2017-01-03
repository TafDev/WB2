Feature: Likes
  As a logged in user I want to like another users, picture

  Background:
    Given I have sample users
    Given I have sample images

    Scenario: I like a picture
      Given I am logged in as "Barvis"
      And I visit the profile page for user "mavis"
      And I click "View Gallery"
      And Sleep 2
      Then I click css ".like"
#      And I should have a like