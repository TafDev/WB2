Feature: Profile
  As a logged in user i want to have access to my profile
  As a logged in user i want to be able to set a profile picture
  As a logged in user i want to be able to set a description
  As a logged in user i want to be able to set my age
  As a logged in user i want to be able to set my gender
  As a logged in user i want to be able to set my fitness level
  As a logged in user i want to be able to set my current goals
  
  Background: 
    Given I have sample users

    Scenario: I have access to my profile
      Given I am logged in as "Barvis"
      And I visit "root"
      When I click "My Profile"
      And I visit the account page for user "Barvis"
      Then I should see "Profile for Barvis"
      
