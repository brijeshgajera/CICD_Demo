*** Settings ***
Documentation     Register with Invalid Data
Suite Setup       Open Browser with Base URL
Suite Teardown    Close Browser
Test Setup        Go To     ${REGISTRATION URL}
Test Template     Registeration With Invalid Data Should Not Succeed
Resource          resource.robot

*** Test Cases ***               USER NAME        EMAIL                 Password            CPassword           ERROR_MESSAGE
Password Doesn't Match           ${VALID USER}    ${VALID EMAIL}        ${VALID PASSWORD}   abcdef              The two passwords do not match
Empty Email                      ${VALID USER}    ${EMPTY}              ${VALID PASSWORD}   ${VALID PASSWORD}   Email is required
Empty Username                   ${EMPTY}         ${VALID EMAIL}        ${VALID PASSWORD}   ${VALID PASSWORD}   Username is required
Empty Password                   ${VALID USER}    ${VALID EMAIL}        ${EMPTY}            ${EMPTY}            Password is required
Empty All Fields                 ${EMPTY}         ${EMPTY}              ${EMPTY}            ${EMPTY}            Username is required\nEmail is required\nPassword is required
User Already Exists              ${VALID USER}    ${VALID EMAIL}        ${VALID PASSWORD}   ${VALID PASSWORD}   Username already exists

*** Keywords ***
Registeration With Invalid Data Should Not Succeed
    [Arguments]    ${username}    ${email}      ${password}    ${cpassword}     ${error}
    Input Username    ${username}
    Input Email  ${email}
    Input Password       name:password_1    ${password}
    Input Password       name:password_2    ${cpassword}
    Capture Page Screenshot
    Submit Credentials
    Registration Should Not Happen    ${error}

Registration Should Not Happen
    [Arguments]  ${error}
    Location Should Be    ${REGISTRATION URL}
    Message Should Be  ${error}

