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
    Click cart icon

# Verify shop landing page / homepage


# Verify shop 









