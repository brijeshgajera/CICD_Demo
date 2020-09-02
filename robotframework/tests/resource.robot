*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library     SeleniumLibrary
Library     DateTime
Library     OperatingSystem
Library     Screenshot
Library		BuiltIn 
Library		Collections
Library		String

*** Variables ***
${BASE URL}        http://${SERVER}
${BROWSER}        chrome
${VALID USER}     brijesh
${VALID PASSWORD}    brijesh
${VALID EMAIL}      brijesh@gmail.com
${LOGIN URL}      ${BASE URL}/login.php
${WELCOME URL}      ${BASE URL}/index.php
${REGISTRATION URL}    ${BASE URL}/register.php
${ERROR URL}      ${BASE URL}/login.php

*** Keywords ***
Open Browser with Base URL
    Open Browser    ${BASE URL}    ${BROWSER}
    Maximize Browser Window
    ${Date}=        Get Current Date   result_format=%Y-%m-%d %H-%M-%S

Login Page Should Be Open
    Title Should Be    Registration system PHP and MySQL

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open
    Capture Page Screenshot

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}
    Capture Page Screenshot

Input PasswordLogin
    [Arguments]    ${password}
    Input Text    password    ${password}
    Capture Page Screenshot

Input Email
    [Arguments]     ${email}
    Input Text    email    ${email}
    Capture Page Screenshot

Submit Credentials
    Click Button    xpath://button[@type='submit']
    Capture Page Screenshot

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Message Should Be  You are now logged in
    Capture Page Screenshot

Logout From Portal
    Click URL    logout
    Capture Page Screenshot

Message Should Be
    [Arguments]  ${message}
    ${text}=    Get Text    xpath://div[contains(@class,'error')]
    should contain  ${text}  ${message}  ignore_case=True
    Capture Page Screenshot

Click URL
    [Arguments]     ${link text}
    Click Link    ${link text}
    Capture Page Screenshot
