Feature: Merge Articles
  As an admin
  In order to organize contents that pertain to same topic
  I want to merge articles

  Background: article related data have been created

  Given an admin "overlord" with password "obeyme" exists
  And a contributor "rubyrocks" with password "railsrulez" exists

  Scenario: Non admin edits article
    Given I am logged in as non admin
    When I am on the edit page of the article entitled "Setting up Rails"
    Then I should not see "Merge Articles"
  
  Scenario: Merge successful
    Given I am logged in as an admin
    And I am on the edit page of the article entitled "Setting up Rails"
    And I fill in "Article ID" with "3"
    And I press "Merge"
    Then the article "Setting up Rails" should be merged with "Rails Quickstart"

    