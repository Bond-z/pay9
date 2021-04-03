*** Settings ***
Resource    ../../common.robot

*** Variables ***
${token}    5edf2cabd592416eba010c6c5ed58f38
${cat_name_create}    Automated_category
${cat_id}    239

*** Test Cases ***
Merchant get token
    [Tags]    authen
    ${token}=    Get token via mobile no

Merchant get otp    
    [Tags]    otp
    ${otp}=    Request otp    +66643659596

Verify otp    
    [Tags]    verify_otp
    ${token}=    Validate otp and get token    +66643659596    4812

Merchant get category list
    [Tags]    category_list
    ${cat_name}=    Get category list    ${token}

Merchant add category
    [Tags]    add_category
    Add category    ${token}    ${cat_name_create}

Merchant delete category
    [Tags]    delete_cat
    Delete category     ${token}    ${cat_id}
    
Merchant create product
    [Tags]    create_product
    Create product     ${token}   




    