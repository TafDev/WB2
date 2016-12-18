Feature: Account
  As a logged in user I want to have access to my account
  As a logged in user I want to view my account
  As a logged in user I want to get premium membership

  Background: 
    Given I have sample users

#    @wip
    Scenario: User accesses account
      Given I am logged in as "Barvis"
      And I visit "root"
      When I click "My Account"
      Then I should see "Workout Buddy Account: Barvis"

        @javascript
      Scenario: User gets premium
      Given I am logged in as "Barvis"
      And I visit "root"
      When I click "My Account"
        And Sleep 2
        And I click css ".stripe-button-el"
        And Sleep 2
          And I fill in "Email" with "barvis@test.com" within_frame "stripe_checkout_app"
        And I fill in "Card number" with "4242424242424242" within_frame "stripe_checkout_app"
          And I fill in "MM / YY" with "10/19" within_frame "stripe_checkout_app"
        And I fill in "CVC" with "123" within_frame "stripe_checkout_app"
        And I click css ".Button-content" within_frame "stripe_checkout_app"
        And Sleep 10
          Then I should see "Premium"
       Then I am now a premium member

