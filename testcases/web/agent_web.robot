*** Settings ***
Resource    ${CURDIR}/../../common.robot
# Resource       ${CURDIR}/../../../../imports/web_imports.robot
Test Setup     Run Keywords    Open agent browser
Test Teardown  Run Keywords    SeleniumLibrary.Close Browser

*** Test Cases ***
Agent create quotation and send to user via email
    [Tags]    quotation
    Set Selenium speed        0.5
    Minimize browser to mobile size
    Login with mobile_no
    Select 1st shop
    Add product to cart 
    Sleep    3s
    Click cart icon
    Select merchant
    Add product qty on quotation page
    Click create quotation button
    Select customer
    Sleep    5s
    Click save quotation
    Click quotation menu
    Select 1st quotation
    Click send email button
    Click quotation menu
    Verify quotation status after sent an email




# Verify shop landing page / homepage


# Verify shop 









