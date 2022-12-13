*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary
Test Setup      open the browser with the Mortage payment url
Test Teardown   Close Browser Session
Resource        resource.robot
*** Variables ***
${error_message_login}      css:.alert-danger
${shop_page_load}           css:.nav-link

*** Test Cases ***
Validate Unsucessful Login

    Fill the login Form     ${username}     ${invalidpassword}
    wait untill Element is located in the page      ${error_message_login}
    verify error message is correct

Validate Cards display in the Shopping page

    Fill the login Form     ${username}     ${validpassword}
    wait untill Element is located in the page      ${shop_page_load}

*** Keywords ***

Fill the login Form
    [arguments]     ${username}         ${password}
    Input Text          id:username             ${username}
    Input Password      id:password             ${password}
    Click Button        signInBtn
    Set Selenium Implicit Wait    200
wait untill Element is located in the page
    [arguments]     ${element}
    Wait Until Element Is Visible   ${element}
verify error message is correct
#   ${results}=  Get Text    ${error_message_login}
#   Should Be Equal As Strings    ${results}    Incorrect username/password.
   Element Text Should Be    ${error_message_login}    Incorrect username/password.
