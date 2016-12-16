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
      Then I should see "Welcome Barvis"

      Scenario: I select a profile picture
        Given I am logged in as "Barvis"
        And I visit "root"
        And I click "My Profile"
        When I click css "#new-img"
        Then I should see "image"


      Scenario: I set a description
        Given I am logged in as "Barvis"
        And I visit the profile page for user "Barvis"
        When I click css "#edit-description"
        And I fill in "profile_description" with "Hi I am Barvis and I do Barvisy things all the time!"
        And I click "Update Profile" within "#description-form"
        Then I should see "Hi I am Barvis and I do Barvisy things all the time!"

      Scenario: I set age
        Given I am logged in as "Barvis"
        And I visit the profile page for user "Barvis"
        When I click css "#edit-age"
        And I fill in "profile_age" with "100"
          And I click "Update Profile" within "#edit-age"
        Then I should see "100"

      Scenario: I set gender
        Given I am logged in as "Barvis"
        And I visit the profile page for user "Barvis"
        When I click css "#profile_gender"
        And I select "Male" from "profile[gender]"
        Then I click "Update Profile" within "#edit-gender"
        Then I should see "Male"

      Scenario: I set fitness level
        Given I am logged in as "Barvis"
        And I visit the profile page for user "Barvis"
        When I click css "#profile_f_level"
        And I select "Expert" from "profile[f_level]"
        Then I click "Update Profile" within "#edit-f_level"
        Then I should see "Expert"

      Scenario: I set my sport preferences
        Given I am logged in as "Barvis"
        And I visit the profile page for user "Barvis"
        When I click css "#sport"
        And I fill in "sport_name" with "Dancing"
        Then I click "Create Sport"
        Then I should have "Dancing"
#        Then I should see "Dancing"




