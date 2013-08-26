Feature: Manage Categories
  As an admin
  In order to manage blog categories
  I want to add new categories or edit existent ones

  Background: blog has been set up

  Given the blog is set up
  And an admin "mastercoder" with password "kneelbeforemepeasants" exists
  And I am logged in as "mastercoder" with password "kneelbeforemepeasants"

  Scenario: Create new article
    Given I am on the create new category page
    Then I should see "Name"