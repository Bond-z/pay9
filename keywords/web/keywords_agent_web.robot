*** Settings ***
Resource      ../../common.robot
Library  ExtendedSelenium2Library



*** Keywords ***
Open agent browser
    Open Browser       ${pay9-agent-dev}      chrome

Login with mobile_no
    Wait Until Element Is Visible    ${txt-mobile_no}
    Press Keys    ${txt-mobile_no}    ${agent-mobile_no}
    Click Element    ${btn-login}
    Press Keys    ${txt-otp}     ${otp-mock}
    Click Element    ${btn-submit-otp}


Minimize browser to mobile size
    Set Window Size        ${400}       ${805}

Select shop
    Go to    ${pay9-agent-dev}/11
    #Element Should Be Visible    ${select-shop}
    #Click Element    ${select-shop}

Add product to cart   
    Scroll Element Into View     ${product-1}  
    Wait Until Element Is Visible    ${product-1}
    Click Element    ${product-1} 
    # Click Element    ${add-qty}
    Wait Until Element Is Visible    ${add-to-cart-btn}
    Click Element    ${add-to-cart-btn}
    # Sleep    3s   
    # Click Element    ${cart-icon}
    # Click Element    ${select-shop}
    # Click Element    ${create-quo}
    # Click Element    ${ok-btn}

