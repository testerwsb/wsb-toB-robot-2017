*** Settings ***
Documentation  My bdd test cases
Library  Selenium2Library

*** Test Cases ***
New User registration
    [Tags]  Creating new account
    Given ICM application is working
     And User creates new account
     When User fills registration form
     Then New account exists

New user registration with blank fields
    [Tags]  Try to register with empty data fields
    Given ICM application is working
    And User creates new account
    When User fills no data into form
    Then Registration faild

Log in with invalid data
    [Tags]  Try to log in with invalid data
    Given ICM application is working
    And User tries to log in
    When User fills data of non existing account
    Then Log in faild

*** Keywords ***
ICM application is working
    Open Browser  about:blank  chrome
    Go To  http://localhost:9998
    Wait Until page contains  Zarządzanie incydentami

User creates new account
    Click Link  xpath=//a[@href='/signup']

User fills registration form
    Input Text  id=name  deedee
    Input Text  id=email  dee@dee.pl
    Input Text  id=password  blabla1
    Input Text  id=confirmedPassword  blabla1
    Click Button  xpath=//button[@class='btn btn-default']

New account exists
    Wait Until page contains  Incydenty
    Sleep  3s
    Click Link  xpath=//a[@href='/logout']
    Close Browser

User fills no data into form
    Click Button  xpath=//button[@class='btn btn-default']
    Wait Until page contains  Wartość nie może być pusta
    Sleep  5s

Registration faild
    Close Browser

User tries to log in
    Click Link  xpath=//a[@href='/signin']

User fills data of non existing account
    Input Text  id=inputEmail  lola@bla.pl
    Input Text  id=inputPassword  lala1
    Click Button  xpath=//button[@class='btn btn-default']

Log in faild
    Wait Until page contains  Incydenty
    Sleep  3s
    Close Browser



