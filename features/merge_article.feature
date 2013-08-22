Feature: Merge Articles
  As an admin
  In order to organize contents that pertain to same topic
  I want to merge articles

  Background: article related data have been created

  Given the blog is set up
  And an admin "overlord" with password "obeyme" exists
  And a contributor "rubyrocks" with password "railsrulez" exists

  And user "rubyrocks" wrote articles:
  | title 	       | body					|
  | Setting up Rails   | Follow these steps to get started	|

  Scenario: Non admin edits article
    Given I am logged in as "rubyrocks" with password "railsrulez"
    When I go to the edit page of the article entitled "Setting up Rails"
    Then I should not see "Merge Articles"
  
  Scenario: Merge successful
    Given I am logged in as an admin
    And I am on the edit page of the article entitled "Setting up Rails"
    And I fill in "Article ID" with "3"
    And I press "Merge"
    Then the article "Setting up Rails" should be merged with "Rails Quickstart"

    