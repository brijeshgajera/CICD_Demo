*** Settings ***
Documentation     Register with Valid Data
Resource  resource.robot

*** Test Cases ***
Registration with Valid Data
    Open Browser with Base URL
    Go To   ${REGISTRATION URL}
    Input Username    ${VALID USER}
    Input Email       ${VALID EMAIL}
    Input Password       name:password_1    ${VALID PASSWORD}
    Input Password       name:password_2    ${VALID PASSWORD}
    Capture Page Screenshot
    Submit Credentials
    Welcome Page Should Be Open
    Logout From Portal


Test Redirection Link
    Open Browser with Base URL
    Go To Login Page
    Click Link      Sign up
    Location Should Be    ${REGISTRATION URL}
    Capture Page Screenshot
    Click Link      Sign in
    Location Should Be    ${LOGIN URL}
    Capture Page Screenshot