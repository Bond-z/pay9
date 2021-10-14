*** Settings ***
Resource    ../../common.robot


*** Test Cases ***
Agent login with mobile no.
    [Tags]    authen
    ${otp}=   Request otp    ${mobile_no}
    # ${token}=    Get token via mobile no
    # Get merchant    ${token}


    