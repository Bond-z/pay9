*** Settings ***
Resource     ../../common.robot

*** Test Cases ***
Agent create quotation
    [Tags]    quotation
    Open agent browser
    Minimize browser to mobile size