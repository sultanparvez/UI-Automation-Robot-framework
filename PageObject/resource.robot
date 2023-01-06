*** Settings ***
Documentation   Robot Framework
Library    SeleniumLibrary
*** Variables ***
${username}             rahulshettyacademy
${invalidPassword}      463216
${validpassword}        learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/
*** Keywords ***
open the browser with the Mortage payment url
    Create Webdriver    Chrome  executable_path=../Drivers/chromedriver
    Go To               ${url}
Close Browser Session
    Close Browser