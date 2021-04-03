*** Settings ***
Resource    ../../common.robot

*** Test Cases ***
Agent create quotation and send to user via email
    [Tags]    quotation
    Open agent browser
    Minimize browser to mobile size







