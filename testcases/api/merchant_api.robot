*** Settings ***
Resource    ../../common.robot


*** Test Cases ***
Merchant get token
    [Tags]    authen
    ${token}=    Get token via mobile no
    


    