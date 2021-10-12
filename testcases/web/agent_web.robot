*** Settings ***
Resource    ../../common.robot

*** Test Cases ***
Agent create quotation and send to user via email
    [Tags]    quotation
    Set Selenium speed   0.5
    Open agent browser
    Minimize browser to mobile size
    Login with mobile_no
    Select shop
    Add product to cart 

# Verify shop landing page / homepage


# Verify shop 







