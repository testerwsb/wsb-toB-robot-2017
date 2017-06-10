*** Settings ***
Library  Selenium2Library

*** Test Cases ***
New User registration
    New User registration    deedee    dee@dee.pl    blabla1    blabla1

New user registration with blank fields
    New User registration with blank fields    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}

Log in with invalid data
    Log in with invalid data    lola@bla.pl    lala1

*** Keywords ***
New User registration
    [Arguments]    ${name}    ${email}    ${password}    ${confirmedPassword}
    Open Browser  http://localhost:9998/signup  chrome
    Input Text    id=name    ${name}
    Input Text    id=email    ${email}
    Input Text    id=password    ${password}
    Input Text    id=confirmedPassword    ${confirmedPassword}
    Click Button  xpath=//button[@class='btn btn-default']
    Wait Until page contains  Incydenty
    Click Link  xpath=//a[@href='/logout']
    [Teardown]  Close Browser

New User registration with blank fields
    [Arguments]    ${name}    ${email}    ${password}    ${confirmedPassword}
    Open Browser  http://localhost:9998/signup  chrome
    Input Text    id=name    ${name}
    Input Text    id=email    ${email}
    Input Text    id=password    ${password}
    Input Text    id=confirmedPassword    ${confirmedPassword}
    Click Button  xpath=//button[@class='btn btn-default']
    Wait Until page contains  Form contains errors. Please try again.
    [Teardown]  Close Browser

Log in with invalid data
    [Arguments]    ${email}    ${password}
    Open Browser  http://localhost:9998  chrome
    Wait Until page contains  Zarządzanie incydentami
    Click Link  xpath=//a[@href='/signin']
    Input Text  id=inputEmail  ${email}
    Input Text  id=inputPassword  ${password}
    Click Button  xpath=//button[@class='btn btn-default']
    Wait Until page contains  Sign in error. Please try again.
    [Teardown]  Close Browser