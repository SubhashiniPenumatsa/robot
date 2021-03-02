*** Setting ***
Documentation                   This is some basic infor about the whole test suite
Library                         SeleniumLibrary
Test Setup                      Begin Web Test
Test Teardown                   End Web Test
*** Variables ***
${BROWSER}                      chrome
${URL}                          https://www.willys.se/
${SEARCH-TERM}                  kiwi

*** Keywords ***
Begin Web Test
    Open browser                about:blank     ${BROWSER}
    set selenium speed          1
Go To Web Page
    Load Page
    Verify Page Loaded
Load Page
    Go to                       ${URL}
Verify Page Loaded
    Wait until Page Contains    Handla billig mat online
Search For Product
    [Arguments]                 ${search-term}   ${search-result}
    Enter Search Term           ${search-term}
    Submit Search
    Verify Search Completed     ${search-result}
Enter Search Term
    [Arguments]                 ${search-term}
    Input Text                  id=selenium--search-items-input   ${search-term}
Submit Search
    Press Keys                  xpath://input[@id="selenium--search-items-input"]       RETURN
    Press Keys                  xpath://input[@id="selenium--search-items-input"]       RETURN
Verify Search Completed
    [Arguments]                 ${search-result}
    Wait until Page Contains    ${search-result}
End Web Test
    Close Browser
*** Test Cases ***
User can access website
    [Documentation]             This is some basic info about the test
    [Tags]                      Test 1
    Go To Web Page




User can search for a product
    [Documentation]             This is some basic info about the test
    [Tags]                      Test 2
    Go To Web Page
    Search For Product          Apple        Sökord: Apple


User can search for another product
    [Documentation]             This is some basic info about the test
    [Tags]                      Test 3
    Go To Web Page
    Search For Product          Godis        Sökord: Godis
