*** Settings ***
Resource    ../../common.robot

*** Test Cases ***
Merchant backoffice website
    [Tags]    merchant
    Open merchant browser
    Merchant create product    