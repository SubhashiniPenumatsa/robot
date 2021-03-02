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
verify Login
    input text    xpath://*[@id="email"]   ${USERID}
    input text   xpath://*[@id="password"]   ${PASSWORD}
    Press Keys    xpath://*[@id="login"]      RETURN
trip book
     Press Keys    xpath://*[@id="reset"]     RETURN
     input text    xpath://*[@id="start"]      0303

     input text    xpath://*[@id="end"]        0304
     Press Keys    xpath://*[@id="continue"]   RETURN
End Web Test
  close all browsers



*** Test Cases ***
User can access website
    [Documentation]
    [Tags]                      Checking login
     Begin Web Test
     verify Login


User can book for the trip
     [Documentation]
     [Tags]                      Booking trip
      trip book
      End Web Test





