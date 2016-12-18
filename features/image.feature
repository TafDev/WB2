Feature: Image
  As a logged in user I want to upload images
  
  Background: 
    Given I have sample users
    
      @javascript
    Scenario: I upload an image
      Given I am logged in as "Barvis"
      And I visit "root"
      And I click "My Gallery"
      When I click "Upload images"
#      And I click css "#media-dropzone"
      And I upload an image
      Then I should have an image


    