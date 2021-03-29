*** Settings ***
Resource    ${CURDIR}/../../keywords/web/web_imports.robot 


*** Test Cases ***
Verify product is synced to PIM
    [Tags]    sku
    Set Test Variable    ${sku}     MJT50161164
    Verify sku create on PIM      ${sku} 
    