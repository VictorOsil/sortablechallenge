# language: en
Feature: Sort rows from the lowest value to the top

Scenario: Sort rows - ascending
Given I am on the sorting page
When I sort the rows in ascending order
Then the items are shown in ascending order