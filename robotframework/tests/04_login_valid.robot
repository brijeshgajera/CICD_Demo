*** Settings ***
Documentation     Login with valid Username and Password
Resource  resource.robot

*** Test Cases ***
Login with valid credentials
    Open Browser with Base URL
    Go To Login Page
    Input Username    ${VALID USER}
    Input PasswordLogin    ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open
    Logout From Portal
    
    [Teardown]    Close Browser