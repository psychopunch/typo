Feature: Merge Articles
  As an admin
  In order to organize contents that pertain to same topic
  I want to merge articles

  Background: article related data have been created

  Given the blog is set up
  And an admin "overlord" with password "obeyme" exists
  And a contributor "rubyrocks" with password "railsrulez" exists
  And a contributor "pseudonym" with password "iwritethings" exists

  And user "rubyrocks" wrote articles:
  | title 	       | body					|
  | Setting up Rails   | Follow these steps to get started	|

  And user "pseudonym" wrote articles:
  | title 	       | body					|
  | Rails Quickstart   | This is a great guide for beginners	|

  Scenario: Non admin edits article
    Given I am logged in as "rubyrocks" with password "railsrulez"
    When I go to the edit page of the article entitled "Setting up Rails"
    Then I should not see "Article ID"
  
  Scenario: Merge successful
    Given I am logged in as "overlord" with password "obeyme"
    And I am on the edit page of the article entitled "Setting up Rails"
    And I fill in "merge_with" with id of article "Rails Quickstart"
    And I press "Merge"
    Then I should be on the edit page of the article entitled "Setting up Rails"
    And a merged article entitled "Setting up Rails" should be created

    