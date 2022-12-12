*** Settings ***
Documentation   To validate the login form
Library    SeleniumLibrary

*** Test Cases ***
Validate Unsucessful Login
    open the browser with the Mortage payment url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortage payment url
    Create Webdriver    Chrome  executable_path=G:\Automation_Bro\ROBOT\UI-Automation-Robot-framework\Drivers\chromedriver
    Go To    https://rahulshettyacademy.com/loginpagePractise/
Fill the login Form
    Input Text    id:username   rahulshettyacademy
    Input Password    id:password    125643
    Click Button    signInBtn
    Set Selenium Implicit Wait    200
wait until it checks and display error message
    Wait Until Element Is Visible   css:.alert-danger
verify error message is correct
   ${results}=  Get Text    css:.alert-danger
   Should Be Equal As Strings    ${results}    Incorrect username/password.