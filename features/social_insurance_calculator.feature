Feature: Calculate social insurance contributions

 As a Employee
 I want to calculate my social insurance contributions based on my gross salary
 So that I can make plans with my net salary

 Background:
  Given I am on the calculate page
  And I want to calculate with the social insurance percentages of 2012

 Scenario Outline: calculate social insurance contributions
  Given I am "<years>" old
  And I have "<children>" child / children
  When I enter "<gross_salary>" gross salary
  And I click on "Berechne..."
  Then the outcome should be "<total_contributions>"


 Scenarios: No additional nursing care insurance contribution
  | gross_salary | years | children | total_contributions |
  | 3000         | 22    | 0        | 614,25 EUR          |
  | 3500         | 23    | 1        | 716,63 EUR          |
  | 4000         | 25    | 1        | 819,00 EUR          |
       
 Scenarios: Additional nursing care insurance contribution
  | gross_salary | years | children | total_contributions |
  | 3000         | 23    | 0        | 621,75 EUR          |
  | 3500         | 23    | 0        | 725,38 EUR          |
  | 4000         | 25    | 0        | 829,00 EUR          |
