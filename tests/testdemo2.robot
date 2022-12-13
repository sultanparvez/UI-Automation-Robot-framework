*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary
Test Setup      open the browser with the Mortage payment url
Test Teardown   Close Browser Session
Resource        resource.robot
*** Variables ***
${error_message_login}      css:.alert-danger

*** Test Cases ***
Validate Unsucessful Login

    Fill the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***

Fill the login Form
    Input Text          id:username             ${username}
    Input Password      id:password             ${invalidPassword}
    Click Button        signInBtn
    Set Selenium Implicit Wait    200
wait until it checks and display error message
    Wait Until Element Is Visible   ${error_message_login}
verify error message is correct
#   ${results}=  Get Text    ${error_message_login}
#   Should Be Equal As Strings    ${results}    Incorrect username/password.
   Element Text Should Be    ${error_message_login}    Incorrect username/password.
