*** Settings ***
Resource    ../../common.robot


*** Test Cases ***
Agent login with mobile no.
    [Tags]    authen
    ${token}=    Get token via mobile no
    Get merchant    ${token}


    