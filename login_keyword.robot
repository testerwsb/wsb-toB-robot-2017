*** Settings ***
Documentation  My kdd test cases
Library  Selenium2Library

*** Test Cases ***
New User registration
    [Documentation]  Registration of new user
    [Tags]  Creating new account
    Open Browser  http://localhost:9998  chrome
    Wait Until page contains  Zarządzanie incydentami
    Click Link  xpath=//a[@href='/signup']
    Input Text  id=name  deedee
    Input Text  id=email  dee@dee.pl
    Input Text  id=password  blabla1
    Input Text  id=confirmedPassword  blabla1
    Click Button  xpath=//button[@class='btn btn-default']
    Wait Until page contains  Incydenty
    Sleep  3s
    Click Link  xpath=//a[@href='/logout']
    Close Browser

New user registration with blank fields
    [Documentation]  Empty fields registration
    [Tags]  Try to register with empty data fields
    Open Browser  http://localhost:9998  chrome
    Wait Until page contains  Zarządzanie incydentami
    Click Link  xpath=//a[@href='/signup']
    Click Button  xpath=//button[@class='btn btn-default']
    Wait Until page contains  Wartość nie może być pusta
    Sleep  3s
    Close Browser

Log in with invalid data
    [Documentation]  Invalid data log in
    [Tags]  Try to log in with invalid data
    Open Browser  http://localhost:9998  chrome
    Wait Until page contains  Zarządzanie incydentami
    Click Link  xpath=//a[@href='/signin']
    Input Text  id=inputEmail  lola@bla.pl
    Input Text  id=inputPassword  lala1
    Click Button  xpath=//button[@class='btn btn-default']
    Wait Until page contains  Incydenty
    Sleep  3s
    Close Browser
*** Keywords ***