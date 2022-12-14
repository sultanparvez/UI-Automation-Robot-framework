*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary
Test Teardown   Close Browser
*** Variables ***
${error_message_login}      css:.alert-danger

*** Test Cases ***
Validate Unsucessful Login
    open the browser with the Mortage payment url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortage payment url
    Create Webdriver    Chrome  executable_path=../Drivers/chromedriver
    Go To    https://rahulshettyacademy.com/loginpagePractise/
Fill the login Form
    Input Text    id:username   rahulshettyacademy
    Input Password    id:password    125643
    Click Button    signInBtn
    Set Selenium Implicit Wait    200
wait until it checks and display error message
    Wait Until Element Is Visible   ${error_message_login}
verify error message is correct
#   ${results}=  Get Text    ${error_message_login}
#   Should Be Equal As Strings    ${results}    Incorrect username/password.
   Element Text Should Be    ${error_message_login}    Incorrect username/password.
