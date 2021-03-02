# Created by SubhashiniPenumatsa at 2021-03-01
Feature: Infotiv car rental website testing
  Scenario:
    Given User on the Infotivcar homepage
    When  User enters valid email and password
    And User clicks the Login button
    Then User is logged in

    Scenario:
      Given User on the Infotivcar homepage
    When  User enters valid dates
    And User clicks the continue button
    Then User on the Show car page

      Scenario:
      Given User on the Show car page
    When  User selects the dropdown of Make and Passengers list
    And User clicks the Book button
    Then User on the Confirm book page

        Scenario:
      Given User on the Confirm book page
    When  User enters valid card details
    And User clicks the Confirm button
    Then User car is booked



