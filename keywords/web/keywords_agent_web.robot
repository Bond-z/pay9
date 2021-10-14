*** Settings ***
Resource      ${CURDIR}/../../common.robot
Library      ExtendedSelenium2Library    



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
    Set Window Size             ${400}       ${805}     #${WIDTH_MOB_WEB}    ${HEIGHT_MOB_WEB}

Select 1st shop
    Wait Until Element Is Visible    ${select-1st-shop}
    Element Should Be Visible    ${select-1st-shop}
    Click Element    ${select-1st-shop}

    Wait Until Element Is Visible     ${lbl-recommended}
    ${result}=    Get text        ${lbl-recommended}
    Should Be Equal     ${result}    สินค้าแนะนำ
    

Add product to cart   
    Scroll Element Into View     ${product-1}  
    Wait Until Element Is Visible    ${product-1}
    Click Element    ${product-1} 
    # Click Element    ${add-qty}
    Wait Until Element Is Visible    ${add-to-cart}
    Click on add to cart button

Click cart icon
    Click Element    ${cart-icon}
    # Click Element    ${select-shop}
    # Click Element    ${create-quo}
    # Click Element    ${ok-btn}

Select 1st product


Select 2nd product

Click on add to cart button
    Click Element    ${add-to-cart}

Click add quantity 

Click recrease quantity

Select all product in cart

Deselect 1st product in cart

Click create quotation button

Select customer

Add product qty on quotation page

Click save quotation

Click send email button

Click confirm sending an email

Verify order id on quotation menu

Verify status 

Verify date create and date expire

Verify status of quotation





