*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library     Collections
Library     ../customLibraries/Shop.py
Test Setup      open the browser with the url
Suite Setup
Suite Teardown
Test Teardown   Close Browser session
Resource        ../PO/Generic.robot
Resource        ../PO/LandingPage.robot
Resource        ../PO/ShopPage.robot
Resource        ../PO/CheckoutPage.robot
Resource        ../PO/ConfirmationPage.robot


*** Variables ***
@{listofProducts}           Samsung Note 8     Nokia Edge
${country_name}             Bangladesh


*** Test Cases ***
Validate UnSuccesful Login
     [Tags]      SMOKE      REGRESSION
     LandingPage.Fill the login Form     ${user_name}    ${invalid_password}
     LandingPage.wait until Element is located in the page
     LandingPage.verify error message is correct



Veify the end to end ecommerce Product purchase process
    [Tags]      REGRESSION
    LandingPage.Fill the login Form     ${user_name}    ${valid_password}
    ShopPage.wait until Element is located in the page
    ShopPage.Verify Card titles in the Shop page
    add items to cart and checkout      ${listofProducts}
    CheckoutPage.Verify items in the Checkout Page and proceed
    ConfirmationPage.Enter the Country and select the terms      ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase



Verify user is able to fillup the login form
    LandingPage.Fill the Login Details Form
