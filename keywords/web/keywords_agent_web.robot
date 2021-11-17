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
    Set Window Size             ${375}       ${812}     #${WIDTH_MOB_WEB}    ${HEIGHT_MOB_WEB}

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

Select merchant
    Wait Until Element Is Visible    ${checkbox-merchant}
    Click Element    ${checkbox-merchant}


Select 1st product


Select 2nd product

Click on add to cart button
    Click Element    ${add-to-cart}
    Verify badge icon is visible after add to cart

Click add quantity on cart page
    Click Element    ${add-qty}

Verify badge icon is visible after add to cart
    Wait Until Element Is Visible     ${badge-icon} 

Click recrease quantity

Select all product in cart

Deselect 1st product in cart

Add product qty on quotation page
    Click Element    ${add-qty}

Click create quotation button
    Click Element    ${btn-create-quo}
    Wait Until Element Is Visible     ${select-customer} 

Select customer
    Click Element    ${select-customer}

Click save quotation
    Scroll Element Into View     ${cancel-quotation} 
    Wait Until Element Is Visible     ${save-quotation}
    Click Element    ${save-quotation} 
    Sleep    3s

Click quotation menu    
    Click Element    ${icon-quotation}

Verify quotation after created   
    Wait Until Element Is Visible    ${recent-quotation}
    ${customer-name}=    SeleniumLibrary.Get text    ${recent-quotation}
    Should Be Equal     ${customer-name}    Automated  
    Verify quotation status    รายการใหม่  

Select 1st quotation
    Wait Until Element Is Visible    ${recent-quotation}
    Click Element    ${recent-quotation}

Set expire quotation date 
    Scroll Element Into View    ${setup-expire-lbl}
    Sleep    2s
    Wait Until Element Is Visible    ${select-expire-quo}
    Click Element    ${select-expire-quo}
    Click Element    ${date-picker-today}

Click send email button
    Click Element    ${btn-send-email}
    Wait Until Element Is Visible    ${lbl-send-email}
    Click Element    ${modal-send-email-btn}
    Sleep    3s
    
Verify quotation status after sent an email
    Verify quotation status    รอพิจารณา

Verify quotation status
    [Arguments]    ${status}
    ${current-status}=    SeleniumLibrary.Get text    ${quotation-status}
    Should Be Equal     ${current-status}    ${status}    


Click confirm sending an email

Verify order id on quotation menu

Verify status 

Verify date create and date expire

Verify status of quotation





