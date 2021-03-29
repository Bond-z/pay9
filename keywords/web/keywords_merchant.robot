*** Settings ***
Resource      ../../common.robot


*** Variables ***
${xpath_add_product}     //*[@id="app"]/div/main/div/div/div/div/div/div[2]/div/div[2]/a/span
${txt_product_name}      //*[@class="pt-0 col col-6"]/span[1]/div
${txt_brandname}         //*[@class="pt-0 col col-6"]/span[2]/div
${product_name}     Macbook air M1


*** Keywords ***
Open merchant browser
    Open Browser       ${url_merchant_dev}        chrome
    Maximize Browser Window
    Set Selenium speed   0.5

Merchant create product
    Click element     ${xpath_add_product} 
    #Click element     ${xpath_product_list}
    Input Text        ${txt_product_name}      ${product_name}  
    Input Text        ${txt_brandname}     ${EMPTY}
    Input Text        ${txt_brandname}     ${brandname}

