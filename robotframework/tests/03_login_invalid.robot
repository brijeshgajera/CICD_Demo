*** Settings ***
Documentation     Login with Invalid Username or Password
Suite Setup       Open Browser with Base URL
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***               USER NAME        PASSWORD              ERROR_MESSAGE
Invalid Username                 invalid          ${VALID PASSWORD}     Wrong username/password combination
Invalid Password                 ${VALID USER}    invalid               Wrong username/password combination
Invalid Username And Password    invalid          whatever              Wrong username/password combination
Empty Username                   ${EMPTY}         ${VALID PASSWORD}     Username is required
Empty Password                   ${VALID USER}    ${EMPTY}              Password is required
Empty Username And Password      ${EMPTY}         ${EMPTY}              Username is required\nPassword is required
            

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}    ${error}
    Input Username    ${username}
    Input PasswordLogin    ${password}
    Submit Credentials
    Login Should Have Failed    ${error}

Login Should Have Failed
    [Arguments]  ${error}
    Location Should Be    ${ERROR URL}
    Message Should Be  ${error}

