*** Settings ***
Resource    Functions.robot

*** Test cases ***
Login all
    Login As Correct    icm-admin@icm.com    !1
    Login As Correct    icm-user1@icm.com    !1
    Login As Correct    icm-user2@icm.com    !1
    Login As Correct    icm-user3@icm.com    !1
    Login As Correct    icm-employee@icm.com    !1
    
Login all incorrect
    Login As Incorrect    icm-admin@icm.com    !11
    Login As Incorrect    icm-user1@icm.com    !12
    Login As Incorrect    icm-user2@icm.com    !13
    Login As Incorrect    icm-user3@icm.com    !14
    Login As Incorrect    icm-employee@icm.com    !15

    
Admin-login 
   Login As Correct    icm-admin@icm.com    !1
   
User1-login
    Login As Correct    icm-user1@icm.com    !1
    
User2-login
    Login As Correct    icm-user2@icm.com    !1
    
User3-login
    Login As Correct    icm-user3@icm.com    !1
    
Employee-login
    Login As Correct    icm-employee@icm.com    !1
        

Logout all
    Logout    icm-admin@icm.com    !1
    Logout    icm-user1@icm.com    !1
    Logout    icm-user2@icm.com    !1
    Logout    icm-user3@icm.com    !1
    Logout    icm-employee@icm.com    !1
    
    
Admin-logout
    Logout    icm-admin@icm.com    !1
    
User1-logout
    Logout    icm-user1@icm.com    !1
    
User2-logout
    Logout    icm-user2@icm.com    !1    
    
User3-logout
    Logout    icm-user3@icm.com    !1
    
Employee-logout
    Logout    icm-employee@icm.com    !1  
    
    
Admin-checking role user
    Checking Role    ROLE_USER    
    
Admin-checking role employee
    Checking Role    ROLE_EMPLOYEE  
    
#Admin-checking role admin
    #Checking Role    ROLE_ADMIN
    #Table Cell Should Contain    accounts    2    4    ROLE_ADMIN
    #[Teardown]    Close Browser
    
    
Admin-adding account
    Add account    Zosia     zosia@wp.pl    505-505-505    12345

    
Login user with adding an incident
    Add incident    Pękająca ściana    pęka sciana po całej długości w salonie    Lubawska 1    Gdynia
    
    
Login user with checking incident status
    Checking status    NEW    New
    Checking status    CONFIRMED    Confirmed
    Checking status    NOT_CONFIRMED    Not confirmed
    #Checking status    SOLVED    Solved
    #Checking status    CLOSED    Closed
    #Checking status    ALL    All
