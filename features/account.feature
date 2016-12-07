Feature: Account
  As a logged in user I want to have access to my account
  As a logged in user I want to view my account
  
  Background: 
    Given I have sample users

    @wip
    Scenario: User accesses account
      Given I am logged in as "Barvis"
      And I visit "root"
      When I click "My Account"
      Then I should see "Account for Barvis"