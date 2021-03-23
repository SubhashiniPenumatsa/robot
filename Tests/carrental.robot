*** Setting ***
Documentation                   This is some basic infor about the whole test suite
Library                         SeleniumLibrary
Library                         DateTime
Test Setup                      Given User on the Infotivcar homepage
Test Teardown                   End Web Test
*** Variables ***
${BROWSER}                      chrome
${URL}                          http://rental30.infotiv.net/
${USERID}                       abc@info.com
${PASSWORD}                     test123
${SIGNINMESSAGE}                You are signed in
${CARSELECTPAGE}                What would you like to drive
${CONFIRMBOOK}                  Confirm booking



*** Keywords ***
Given User on the Infotivcar homepage
    Open browser                 ${URL}    ${BROWSER}
    set selenium speed          1
    Wait until Page Contains    Infotiv Car Rental

When User enters valid email and password
    input text    xpath://*[@id="email"]   ${USERID}
    input text   xpath://*[@id="password"]   ${PASSWORD}

And User clicks the Login button
    Press Keys    xpath://*[@id="login"]      RETURN

Then User is logged in
    element should contain  xpath://*[@id="welcomePhrase"]  ${SIGNINMESSAGE}

User enters valid dates to book car
     Press Keys    xpath://*[@id="reset"]     RETURN
     input text    xpath://*[@id="start"]      0323

     input text    xpath://*[@id="end"]        0324

User clicks the continue button

     Press Keys    xpath://*[@id="continue"]   RETURN

User on the car selection page
     element should contain  xpath://*[@id="questionText"]  ${CARSELECTPAGE}


User selects the Make and Number Of Passengers To Book Car
  click element    xpath=//*[@id="ms-list-1"]/button/span
  select checkbox   xpath=//*[@id="ms-opt-1"]
  click element    xpath=//*[@id="ms-list-1"]/button/span
  click element    xpath=//*[@id="ms-list-2"]/button/span
  select checkbox   xpath=//*[@id="ms-opt-6"]
  click element    xpath=//*[@id="ms-list-2"]/button/span

User clicks the Book button
  Press Keys    xpath://*[@id="carSelect1"]     RETURN

User on the Confirm book page
    element should contain  xpath://*[@id="questionText"]   ${CONFIRMBOOK}

User enters valid card payment details
    input text          xpath://*[@id="cardNum"]     2345679832547628
    input text          xpath://*[@id="fullName"]    Subhashini
    click element       xpath=//*[@id="confirmSelection"]/form/select[1]
    select from list by index   xpath=//*[@id="confirmSelection"]/form/select[1]  5
    click element       xpath=//*[@id="confirmSelection"]/form/select[2]
    select from list by index   xpath=//*[@id="confirmSelection"]/form/select[2]  4
    input text          xpath=//*[@id="cvc"]    311

User clicks the Confirm booking
    press keys       xpath=//*[@id="confirm"]   RETURN


User Can view bookings on Mypage
    press keys       xpath://*[@id="mypage"]    RETURN

End Web Test
  close all browsers



*** Test Cases ***
User can do all navigation
    [Documentation]                   This test checks the navigation
    [Tags]                            checking login
    Given User on the Infotivcar homepage
    When User enters valid email and password
    And User clicks the Login button
    Then User is logged in
    End Web Test

User can book for the trip
     [Documentation]             This test checks the book for the trip
     [Tags]                      Booking trip
     Given User on the Infotivcar homepage
     When User enters valid email and password
     And User clicks the Login button
     Then User is logged in
     User enters valid dates to book car
     User clicks the continue button
     User on the car selection page
     End Web Test


User can book car
     [Documentation]             This test checks the car
     [Tags]                      Booking car
     Given User on the Infotivcar homepage
     When User enters valid email and password
     And User clicks the Login button
     Then User is logged in
     User enters valid dates to book car
     User clicks the continue button
     User selects the Make and Number Of Passengers To Book Car
     User clicks the Book button
     User on the Confirm book page
     End Web Test


User
     [Documentation]      This test verifies end to end functionality of book a car
     [Tags]               Booking  a car
     Given User on the Infotivcar homepage
     When User enters valid email and password
     And User clicks the Login button
     Then User is logged in
     User enters valid dates to book car
     User clicks the continue button
     User selects the Make and Number Of Passengers To Book Car
     User clicks the Book button
     User enters valid card payment details
     User clicks the Confirm booking
     User Can view bookings on Mypage
     End Web Test



