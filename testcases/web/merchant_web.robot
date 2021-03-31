*** Settings ***
Resource    ../../common.robot

*** Test Cases ***
Merchant Create shop
    [Tags]    merchant
    Open merchant browser
    Merchant create category   

Merchant create category successful

Merchant upload product sucessful

Merchant invite agent successful

Merchant verify amount and order 



