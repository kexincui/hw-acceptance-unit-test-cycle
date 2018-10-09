Feature: display list of filtered movies 

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
  And I am on the RottenPotatoes home page

Scenario: restrict to movies with 'R' ratings
  When  I check the following ratings: R
  And  I uncheck the following ratings: PG
  And  I press "Refresh"

  Then I should see "Alien"
  And  I should see "THX-1138"
  And  I should not see "Star Wars"
  And  I should not see "Blade Runner"


Scenario: all ratings selected
  When  I check the following ratings: G, R, PG-13, PG
  And  I press "Refresh"
  Then I should see all the movies