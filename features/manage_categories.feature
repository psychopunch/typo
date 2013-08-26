Feature: Manage Categories
  As an admin
  In order to manage blog categories
  I want to add new categories or edit existent ones

  Background: blog has been set up

  Given the blog is set up
  And an admin "mastercoder" with password "kneelbeforemepeasants" exists
  And I am logged in as "mastercoder" with password "kneelbeforemepeasants"

  Scenario: Create new category
    Given I am on the create new category page
    And I fill in the following:
    | Name     	  | sample			|
    | Keywords	  | sample, test		|
    | Description | this is sample category	|
    And I press "Save"
    Then a new category with name "sample" should be created

  Scenario: Edit existent category
    Given the following category exists:
    | name    | keywords	 | description		|
    | test    | sample, test	 | test category	|
    And I am on the edit category page for "test"
    When I fill in the following:
    | Name     	  | changed_this		|
    | Keywords	  | sample, test		|
    | Description | edited  			|
    And press "Save"
    Then there should be a category "changed_this" with description "edited"
    And there should be no category "test"