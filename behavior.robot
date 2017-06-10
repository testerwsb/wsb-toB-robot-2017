*** Settings ***
Library    Selenium2Library

*** Test Cases ***

Valid Login Admin
    Given Login page is open
    When Login is icm-admin@icm.com and password is !1
    and credentials are submitted
    Then welcome page should be open
    
Valid Login User1
    Given Login page is open
    When Login is icm-user1@icm.com and password is !1
    and credentials are submitted
    Then welcome page should be open
    
Valid Login User2
    Given Login page is open
    When Login is icm-user2@icm.com and password is !1
    and credentials are submitted
    Then welcome page should be open
    
Valid Login User3
    Given Login page is open
    When Login is icm-user3@icm.com and password is !1
    and credentials are submitted
    Then welcome page should be open
    
Valid Login Employee
    Given Login page is open
    When Login is icm-admin@icm.com and password is !1
    and credentials are submitted
    Then welcome page should be open
    
    
Invalid Login Admin
    Given Login page is open
    When Login is icm-admin@icm.com and password is !11
    and credentials are submitted
    Then user could not log in
    
Invalid Login User1
    Given Login page is open
    When Login is icm-user1@icm.com and password is !12
    and credentials are submitted
    Then user could not log in
    
Invalid Login User2
    Given Login page is open
    When Login is icm-user2@icm.com and password is !13
    and credentials are submitted
    Then user could not log in
    
Invalid Login User3
    Given Login page is open
    When Login is icm-user3@icm.com and password is !14
    and credentials are submitted
    Then user could not log in
    
Invalid Login Employee
    Given Login page is open
    When Login is icm-admin@icm.com and password is !15
    and credentials are submitted
    Then user could not log in
    
    
Logout Login Admin
    Given Login page is open
    When User icm-admin@icm.com with password !1 was logged in
    And Try to logout
    Then Incident management start page should be open
    
Logout Login User1
    Given Login page is open
    When User icm-user1@icm.com with password !1 was logged in
    And Try to logout
    Then Incident management start page should be open
    
Logout Login User2
    Given Login page is open
    When User icm-user2@icm.com with password !1 was logged in
    And Try to logout
    Then Incident management start page should be open
    
Logout Login User3
    Given Login page is open
    When User icm-user3@icm.com with password !1 was logged in
    And Try to logout
    Then Incident management start page should be open
    
Logout Login Employee
    Given Login page is open
    When User icm-employee@icm.com with password !1 was logged in
    And Try to logout
    Then Incident management start page should be open
    

Checking role for user
    Given Login page is open
    When User icm-admin@icm.com with password !1 was logged in
    And Check role for ROLE_USER
    Then You can see all ROLE_USER
    

Checking role for employee
    Given Login page is open
    When User icm-admin@icm.com with password !1 was logged in
    And Check role for ROLE_EMPLOYEE
    Then You can see all ROLE_EMPLOYEE
    

    
    
    
    
Adding an account
    Given Restore database 
    And Login page is open
    When User icm-admin@icm.com with password !1 was logged in
    And Adding an account with name Zosia email zosia@google.com phone 555-555-555 and password 12345 was ok
    Then New acount is created
    

Adding an incident
    Given Login page is open
    When User icm-user1@icm.com with password !1 was logged in
    And Adding an incident type: Pożar description: Pożar duży address: Konwaliowa city: Prabuty 
    Then New incident was created
    
    
Checking an incident status
    Given Login page is open
    When User icm-user1@icm.com with password !1 was logged in
    And Click filter with incident status NEW
    Then Check the list if it has Pożar
    

*** Keywords ***

Restore database
    Open Browser    http://localhost:9998/setup?action=do    browser=chrome
    [Teardown]    Close Browser

Go to Account list
    Go To    http://localhost:9998/account/list

Incident management start page should be open
    Element Text Should Be    tag=h1    Incident Management
    [Teardown]    Close Browser

Try to logout
    Go To    http://localhost:9998/logout

User ${login} with password ${password} was logged in
    Input Text    inputEmail    ${login}
    Input Password    inputPassword    ${password}
    Click Button    signin
    Element Text Should Be    tag=h2    Incidents

Login page is open
    open browser    http://localhost:9998/signin    browser=chrome

Login is ${email} and password is ${password}
    Input Text    inputEmail    ${email}
    Input Password    inputPassword    ${password}

credentials are submitted
    Click Button    signin

welcome page should be open
    Element Text Should Be    tag=h2    Incidents
    [Teardown]    Close browser
    
user could not log in
    Element Text Should Be    alert    Sign in error. Please try again.
    [Teardown]    Close Browser
    
Check role for ${role}
    Go to    http://localhost:9998/account/list
    Go to    http://localhost:9998/account/list?role=${role}
    
You can see all ${role}
    Table Cell Should Contain    accounts    2    4    ${role}
    [Teardown]    Close Browser
    
Adding an account with name ${name} email ${email} phone ${phone} and password ${password} was ok
    Go to    http://localhost:9998/account/list
    Go to    http://localhost:9998/account/create
    Input Text    name    ${name}
    Input Text    email    ${email}
    Input Text    phone    ${phone}
    Input Password    password    ${password}
    Input Text    confirmedPassword    ${password}
    Click Button    create
    
New acount is created
    Element Text Should Be    alert    Account created! 
    [Teardown]    Close Browser
    
Adding an incident type: ${type} description: ${description} address: ${address} city: ${city} 
    Go to    http://localhost:9998/incident/create
    Input Text    type    ${type}
    Input Text    description    ${description}
    Input Text    addressLine    ${address}
    Input Text    cityLine    ${city}
    Click button    create
    
New incident was created
    Element Should Contain    alert    New incident with id
    [Teardown]    Close Browser
    
Click filter with incident status ${status}
    Go To    http://localhost:9998/incident/list?status=${status}
    
    
Check the list if it has ${incident}
    Table Cell Should Contain    incidents    2    3    ${incident}
    [Teardown]    Close Browser
    
    
    

