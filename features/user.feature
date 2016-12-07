Feature: User
  As a user I want to register also my user name
  As a user I want to log in using just user name and password
  As a user I want to be able to sign up using facebook
  As a user I want to log in using facebook


  Scenario: User registers with a username, email, and password
    Given I visit "new_user_registration"
    When I fill in "user_username" with "Barvis"
    And I fill in "user_email" with "barvis@test.com"
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "123456"
    Then I click "Sign up"

  Scenario: User logs in using just username and password
    Given I have sample users
    When I visit "new_user_session"
    And I fill in "user_username" with "Barvis"
    And I fill in "user_password" with "123456"
    And I click "Log in"
    Then I should see "Welcome Barvis"



  @omniauth_test_success
  Scenario: A user successfully signs in with Facebook
    Given I visit "new_user_registration"
    When I click "Sign in with Facebook"
    Then I should see "Successfully authenticated from Facebook account."
    And My email address should be the same as the facebook email
#      And I should see "<string>"
