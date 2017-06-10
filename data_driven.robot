*** Settings ***
Resource    Functions.robot

*** Test cases ***
Login all
    [Template]    Login As Correct
    icm-admin@icm.com    !1
    icm-user1@icm.com    !1
    icm-user2@icm.com    !1
    icm-user3@icm.com    !1
    icm-employee@icm.com    !1
    
Login all incorrect
    [Template]    Login As Incorrect
    icm-admin@icm.com    !11
    icm-user1@icm.com    !12
    icm-user2@icm.com    !13
    icm-user3@icm.com    !14
    icm-employee@icm.com    !15
    
Admin-login
    [Template]    Login As Correct
    icm-admin@icm.com    !1
    
User1-login
    [Template]    Login As Correct
    icm-user1@icm.com    !1
    
User2-login
    [Template]    Login As Correct
    icm-user2@icm.com    !1
    
User3-login
    [Template]    Login As Correct
    icm-user3@icm.com    !1
    
Employee-login
    [Template]    Login As Correct
    icm-employee@icm.com    !1
    
Admin-logout
    [Template]    Logout
    icm-admin@icm.com    !1
    
User1-logout
    [Template]    Logout
    icm-user1@icm.com    !1
    
User2-logout
    [Template]    Logout
    icm-user2@icm.com    !1  
    
User3-logout
    [Template]    Logout
    icm-user3@icm.com    !1
    
Employee-logout
    [Template]    Logout
    icm-employee@icm.com    !1  
    
Logout all
    [Template]    Logout
    icm-admin@icm.com    !1
    icm-user1@icm.com    !1
    icm-user2@icm.com    !1
    icm-user3@icm.com    !1
    icm-employee@icm.com    !1
    
Admin-checking role user
    [Template]    Checking Role
    ROLE_USER
    
Admin-checking role employee
    [Template]    Checking Role
    ROLE_EMPLOYEE
    
Admin-adding account
    [Template]    Add account
    Zosia     zosia@wp.pl    505-505-505    12345
    
Login user with adding an incident
    [Template]    Add incident
    Pękająca ściana    pęka sciana po całej długości w salonie    Lubawska 1    Gdynia
    
Login user with checking incident status
    [Template]    Checking status
    NEW    New
    CONFIRMED    Confirmed
    NOT_CONFIRMED    Not confirmed
