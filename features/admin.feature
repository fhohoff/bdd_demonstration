Feature: Administrate the social insurance percentages

 As an Administrator
 I want to edit the social insurance percentages between 0 and 30 %
 So that I can keep the calculator-page up-to-date

 Background:
  Given I am on the admin page


 Scenario: Successfull update social insurance percentage
  Given I want to update "Krankenversicherung"
  When I update the percentage to "5.0"
  Then I should see on the admin page "5.0" for "Krankenversicherung"

 Scenario: Failed to update social insurance percentage
  Given I want to update "Krankenversicherung"
  When I update the percentage to "55"
  Then I should receive an error
