*** Settings ***
Documentation   To validate the login form
Library         SeleniumLibrary
Library         Collections
Test Setup      open the browser with the Mortage payment url
Test Teardown   Close Browser Session
Resource        ../PO/resource.robot
*** Variables ***
${error_message_login}      css:.alert-danger
${shop_page_load}           css:.nav-link
${mobilePhone}              css:.card-title

*** Test Cases ***
Validate Unsucessful Login

    Fill the login Form     ${username}     ${invalidpassword}
    wait untill Element is located in the page      ${error_message_login}
    verify error message is correct

Validate Cards display in the Shopping page

    Fill the login Form     ${username}     ${validpassword}
    wait untill Element is located in the page      ${shop_page_load}
    Verify card titles in the shop page
    Select the Card     Blackberry

Fill up a form

    Fill the login details and select the user option   ${username}     ${invalidpassword}

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

Verify card titles in the shop page

    @{expectedList} =   Create List     iphone X        Samsung Note 8      Nokia Edge      Blackberry
    ${elements} =       Get WebElements    ${mobilePhone}
    @{actualList} =   Create List
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actualList}     ${element.text}
    END
    Lists Should Be Equal    ${actualList}    ${expectedList}

Select the Card

    [arguments]     ${cardName}
    ${elements} =       Get WebElements    ${mobilePhone}
    ${index}=   Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${cardName}'=='${element.text}'
        ${index}=   Evaluate    ${index}+1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill the login details and select the user option
    [arguments]     ${username}         ${password}
    Input Text          id:username             ${username}
    Input Password      id:password             ${password}
    Click Button    css:input[value='user']
    Wait Until Element Is Visible       css:.modal-body
    Click Button        id:okayBtn
    Click Button        id:okayBtn
    Wait Until Element Is Not Visible   css:.modal-body
    Select From List By Value       css:select[class='form-control']     teach
    Select Checkbox     terms
    Checkbox Should Be Selected     terms