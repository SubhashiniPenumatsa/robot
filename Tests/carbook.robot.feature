# Created by SubhashiniPenumatsa at 2021-03-01
Feature: Infotiv car rental website testing
  Scenario:
    Given User on the Infotivcar homepage
    When  User enters valid email and password
    And User clicks the Login button
    Then User is logged in

    Scenario:
      Given User on the Infotivcar homepage
    When  User enters valid dates to book car
    And User clicks the continue button
    Then User on the car selection page

    Scenario:
      Given User on the car selection page
    When  User selects the Make and Number Of Passengers To Book Car
    And User clicks the Book button
    Then User on the Confirm book page

    Scenario:
      Given User on the Confirm book page
    When  User enters valid card payment details
    And User clicks the Confirm booking
    Then User car is booked
    Then User Can view bookings on Mypage



