*** Setting ***
Documentation                   This is some basic infor about the whole test suite
Library                         SeleniumLibrary
Library                         DateTime
Test Setup                      Begin Web Test
Test Teardown                   End Web Test
*** Variables ***
${BROWSER}                      chrome
${URL}                          http://rental30.infotiv.net/
${USERID}                       abc@info.com
${PASSWORD}                     test123


*** Keywords ***
Begin Web Test
    Open browser                 ${URL}    ${BROWSER}
    set selenium speed          1
    Wait until Page Contains    Infotiv Car Rental
Go To Web Page
    Load Page
    Verify Page Loaded
Load Page
    Go to                                            ${URL}
Verify Page Loaded
    Wait Until Page Contains                        When do you want to make your trip?
Verify Login
    input text    xpath://*[@id="email"]   ${USERID}
    input text   xpath://*[@id="password"]   ${PASSWORD}
    Press Keys    xpath://*[@id="login"]      RETURN
trip book
     Press Keys    xpath://*[@id="reset"]     RETURN
     input text    xpath://*[@id="start"]      0303

     input text    xpath://*[@id="end"]        0304
     Press Keys    xpath://*[@id="continue"]   RETURN
book car
  click element    xpath=//*[@id="ms-list-1"]/button/span
  select checkbox   xpath=//*[@id="ms-opt-1"]
  click element    xpath=//*[@id="ms-list-1"]/button/span
  click element    xpath=//*[@id="ms-list-2"]/button/span
  select checkbox   xpath=//*[@id="ms-opt-5"]
  click element    xpath=//*[@id="ms-list-2"]/button/span
  Press Keys    xpath://*[@id="carSelect1"]     RETURN

card payment
    input text    xpath://*[@id="cardNum"]     2345679832547628
    input text    xpath://*[@id="fullName"]    Subhashini
    click element    xpath=//*[@id="confirmSelection"]/form/select[1]
    select from list by index   xpath=//*[@id="confirmSelection"]/form/select[1]  5
    click element    xpath=//*[@id="confirmSelection"]/form/select[2]
    select from list by index   xpath=//*[@id="confirmSelection"]/form/select[2]  4
    input text        xpath=//*[@id="cvc"]    311
    press keys       xpath=//*[@id="confirm"]   RETURN
    press keys       xpath://*[@id="mypage"]    RETURN

End Web Test
  close all browsers



*** Test Cases ***
User can do all navigation
    [Documentation]                   This test checks the navigation
    [Tags]                            checking login
    Given Begin Web Test
    When Go To Web Page
    Then Verify Login
    End Web Test

User can book for the trip
     [Documentation]             This test checks the book for the trip
     [Tags]                      Booking trip
     Given Begin Web Test
     When Go To Web Page
     Then trip book
     End Web Test


User can book car
     [Documentation]             This test checks the car
     [Tags]                      Booking car
     Given Begin Web Test
     When Go To Web Page
     Then Verify login
     Then trip book
     Then book car
     End Web Test


User can make payment
     [Documentation]              This test checks the payment
     [Tags]                       Making payment
     Given Begin Web Test
     When Go To Web Page
     Then Verify login
     Then trip book
     Then book car
     Then card payment
     End Web Test



