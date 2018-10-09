Feature: display sorted list using different criteria 

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
  And I am on the RottenPotatoes home page

Scenario: sort movies alphabetically
  When I check the following ratings: PG,R
  And I press "Refresh"
  
  When I follow "Movie Title"
  Then I should see "Alien" before "Blade Runner"
  And I should see "Blade Runner" before "Star Wars"
  And I should see "Star Wars" before "THX-1138"

Scenario: sort movies in increasing order of release date
  When I check the following ratings: PG,R
  And I press "Refresh"
  
  When I follow "Release Date"
  Then I should see "1971-03-11" before "1977-05-25"
  And I should see "1977-05-25" before "1979-05-25"
  And I should see "1979-05-25" before "1982-06-25"