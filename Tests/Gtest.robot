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
${SIGNINMESSAGE}                You are signed in
${CARSELECTPAGE}                When do you want to make your trip

*** Keywords ***
Begin Web Test
    Open browser                 ${URL}    ${BROWSER}
    #set selenium speed          1
    Wait until Page Contains    Infotiv Car Rental
verify Login
    input text    xpath://*[@id="email"]   ${USERID}
    input text   xpath://*[@id="password"]   ${PASSWORD}
    Press Keys    xpath://*[@id="login"]      RETURN
Then User is logged in
     page should contain   ${SIGNINMESSAGE}

Mypage booking
    press keys       xpath://*[@id="mypage"]    RETURN
trip book
     Press Keys    xpath://*[@id="reset"]     RETURN
     input text    xpath://*[@id="start"]      0323

     input text    xpath://*[@id="end"]        0324
     Press Keys    xpath://*[@id="continue"]   RETURN

User on the car selection page
     element should contain  xpath://*[@id="questionText"]  ${CARSELECTPAGE}

End Web Test
  close all browsers



*** Test Cases ***
User can access website
    [Documentation]             User can login to website and checks booking
    [Tags]                      Checking login
     Begin Web Test
     verify Login
     Then User is logged in
     Mypage booking

User can book for the trip
     [Documentation]
     [Tags]                      Booking trip
      trip book
      User on the car selection page
      End Web Test





