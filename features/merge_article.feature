Feature: Merge Articles
  As an admin
  In order to organize contents that pertain to same topic
  I want to merge articles

  Background: the data have been added to the database

  Given the following users exist:
  | login   	    | profile_id |
  | nonadmin	    | 2		 |
  | admin	    | 1		 |

  And the following profiles exist:
  | id	    | label	    |
  | 1	    | admin	    |
  | 2	    | contributor   |

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

    