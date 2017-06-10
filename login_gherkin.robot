*** Settings ***
Library  Selenium2Library

*** Test Cases ***
New User registration
    Given ICM application is working
     When User navigates to sign up page
     And User fills registration form
     Then New account exists

New user registration with blank fields
    Given ICM application is working
    When User navigates to sign up page
    And User fills no data into form
    Then Registration faild

Log in with invalid data
    Given ICM application is working
    When User goes to log in page
    And User fills data of non existing account
    Then Log in faild

*** Keywords ***
ICM application is working
    Open Browser  about:blank  chrome
    Go To  http://localhost:9998
    Wait Until page contains  Zarządzanie incydentami

User navigates to sign up page
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
    [Teardown]  Close Browser

User fills no data into form
    Click Button  xpath=//button[@class='btn btn-default']

Registration faild
    Wait Until page contains  Form contains errors. Please try again.
    Sleep  5s
    [Teardown]  Close Browser

User goes to log in page
    Click Link  xpath=//a[@href='/signin']

User fills data of non existing account
    Input Text  id=inputEmail  lola@bla.pl
    Input Text  id=inputPassword  lala1
    Click Button  xpath=//button[@class='btn btn-default']

Log in faild
    Wait Until page contains  Sign in error. Please try again.
    Sleep  3s
    [Teardown]  Close Browser



