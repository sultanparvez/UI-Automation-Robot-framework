*** Settings ***
Documentation   To validate the login form
Library         SeleniumLibrary
Library         Collections
Library         String
Test Setup      open the browser with the Mortage payment url
Test Teardown   Close Browser Session
Resource        ../PO/resource.robot
*** Variables ***
${error_message_login}      css:.alert-danger

*** Test Cases ***
Validate Child window Functionality
    Select the link of child window
    Verify that sucessfully navigated child window
    Grab the Email id
    Switch back to parent window

*** Keywords ***

Select the link of child window

    Click Element       css:.blinkingText
    Sleep                 5

Verify that sucessfully navigated child window
    Switch Window   New
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the Email id

    ${text}=    get text    css:.red
    @{words}=   Split String    ${text}     at
    ${text_split}=      Get From List       ${words}    1
    log     ${text_split}
    @{words_2}=   Split String    ${text_split}
    ${email}=      Get From List    ${words_2}    0
    Set Global Variable         ${email}

Switch back to parent window
    Switch Window   Main
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}
