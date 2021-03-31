*** Settings ***
Resource      ../../common.robot

*** Keywords ***
Open merchant browser
    Open Browser       ${url_merchant_uat}        chrome
    Maximize Browser Window
    Set Selenium speed   0.5

Merchant create category
    Click element    ${create_cat_btn}
    Press Keys       ${txt_cat_name}     Test category_1
    Press Keys      ${txt_cat_name}   RETURN
    Click element    ${save_cat_btn}
    Element Text Should Be    ${xpath_cat_list1}    Test category_1

Merchant create product
    Click element     ${xpath_add_product} 
    #Click element     ${xpath_product_list}
    Press Keys        ${txt_product_name}      ${product_name}  
    Press Keys        ${txt_description}    ${description}
    Click element       ${txt_dropdown_cat}    
