*** Settings ***
Resource    ../../common.robot

*** Variables ***
${token}    3cfb212c04e9428790b35553d3ecc27b


*** Test Cases ***
Merchant get token
    [Tags]    authen
    ${token}=    Get token via mobile no

Merchant get otp    
    [Tags]    otp
    ${otp}=    Request otp    +66643659596

Verify otp    
    [Tags]    verify_otp
    ${token}=    Validate otp and get token    +66643659596    5288

Merchant get category list
    [Tags]    category_list
    Get category list    ${token}

Merchant add category
    [Tags]    add_category
    Add category    ${token}

    


    